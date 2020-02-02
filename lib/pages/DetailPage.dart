import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:scoped_model/scoped_model.dart';

class DetailPage extends StatelessWidget {
  BuildContext mContext;

  int index;

  DetailPage(int index) {
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    this.mContext = context;

    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(title: Text("Product Details"), centerTitle: true),
          body: ScopedModelDescendant<ProductScoppedModel>(
            builder: (BuildContext context, Widget child,
                ProductScoppedModel model) {
              return _buildProductInfoView(model.productList[index], context);
            },
          )),
      onWillPop: onWillPop,
    );
  }

  Future<bool> onWillPop() {
    if (Navigator.canPop(mContext)) {
      Navigator.pop(mContext, false);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget _buildProductInfoView(
      ProductModel productModel, BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
          child: Image.asset(productModel.image),
          padding: EdgeInsets.all(10.0)),
      Container(
        child: Text(productModel.title),
        padding: EdgeInsets.all(10.0),
      ),
      Container(
        child: RaisedButton(
          onPressed: () => {showPopup(context)},
          child: Text(
            "Delete",
          ),
          color: Theme.of(context).accentColor,
        ),
      )
    ]));
  }

  showPopup(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        child: AlertDialog(
          title: Text("Attempting to delete"),
          titleTextStyle: TextStyle(color: Colors.deepOrange, fontSize: 18),
          content: Text("Are you sure that you want to delete the product?"),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 14),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 14))),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: Text("Yes",
                  style: TextStyle(color: Colors.blue, fontSize: 14)),
            )
          ],
        ));
  }
}
