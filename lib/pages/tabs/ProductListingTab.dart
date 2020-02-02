import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    try {
      return ScopedModelDescendant<ProductScoppedModel>(
        builder:
            (BuildContext context, Widget child, ProductScoppedModel model) {
          return _buildListViewWidget(model.productList);
        },
      );
    } on Exception catch (e) {
      return Center(child: Text('Something went wrong' + e.toString()));
    }
  }

  Widget _buildListViewWidget(List<ProductModel> productMap) {
    if (productMap != null) {
      if (productMap.length > 0) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Image.asset(productMap[position].image),
                  title: Text(productMap[position].title.toString()),
                  subtitle: Text(productMap[position].description.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "/updateProduct/" + position.toString(),
                          arguments: productMap[position]);
                    },
                  ),
                ),
                _buildDividerWidget(position, productMap)
              ],
            );
          },
          itemCount: productMap.length,
        );
      }
    }
    return Center(child: Text('No order found'));
  }

  Widget _buildDividerWidget(int position, List<ProductModel> productMap) {
    return (position + 1) >= productMap.length
        ? SizedBox(
            width: 0,
            height: 0,
          )
        : Divider(
            height: 1.0,
            color: Colors.grey,
          );
  }
}
