import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';

import 'AddressWidget.dart';
import 'PriceWidget.dart';
import 'TitleWidget.dart';

class CardWidget extends StatelessWidget {
  ProductScoppedModel productScoppedModel;
  int index;

  CardWidget(this.productScoppedModel, this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    ProductModel product = productScoppedModel.productList[index];

    return Card(
      child: Column(children: [
        Image.asset(
          product.image,
          width: double.infinity,
          height: 180,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleWidget(product.title.toString()),
            PriceWidget(product.price.toString())
          ],
        ),
        AddressWidget("Union Square, Francisco"),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  return Navigator.pushNamed(
                          context, "/product/" + index.toString())
                      .then((isDeleteProduct) {
                    if (isDeleteProduct != null) {
                      if (isDeleteProduct) {
                        productScoppedModel.deleteProduct(index);
                      }
                    }
                  });
                }),
            IconButton(
                icon: Icon(product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  _toggleFavoriteStatus(product, index);
                })
          ],
        )
      ]),
    );
  }

  void _toggleFavoriteStatus(ProductModel product, int position) {
    productScoppedModel.updateProduct(
        ProductModel(product.title, product.description, product.price,
            product.image, !product.isFavorite),
        position);
  }
}
