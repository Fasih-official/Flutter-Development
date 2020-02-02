import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:flutter_app/widgets/ui_elements/CardWidget.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductState extends StatelessWidget {
  bool isFavoriteModeOn = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Manage Products'),
                subtitle: Text('Handy guide to manage products'),
                onTap: () => {Navigator.pushNamed(context, "/admin")},
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Fasih'),
          actions: <Widget>[
            ScopedModelDescendant<ProductScoppedModel>(
              builder: (BuildContext context, Widget child,
                  ProductScoppedModel model) {
                return _buildFavoriteListFetching(model);
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ScopedModelDescendant<ProductScoppedModel>(
                builder: (BuildContext context, Widget child,
                    ProductScoppedModel model) {
                  return buildList(model);
                },
              ),
            )
          ],
        ));
  }

  Widget buildList(ProductScoppedModel model) {
    List<ProductModel> productList = model.productList;

    if (productList.length > 0) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return CardWidget(model, index);
          },
          itemCount: productList.length);
    } else {
      return Center(
        child: Text('No product found... Please add some to continue'),
      );
    }
  }

  Widget _buildFavoriteListFetching(ProductScoppedModel model) {
    return IconButton(
      onPressed: () {
        isFavoriteModeOn = !isFavoriteModeOn;
        model.notifyFavoriteListingMode(isFavoriteModeOn);
      },
      icon: Icon(isFavoriteModeOn ? Icons.favorite : Icons.favorite_border),
    );
  }
}
