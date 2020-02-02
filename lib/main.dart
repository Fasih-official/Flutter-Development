import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/pages/Auth.dart';
import 'package:flutter_app/pages/DetailPage.dart';
import 'package:flutter_app/pages/ManageProducts.dart';
import 'package:flutter_app/pages/UpdateProduct.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:flutter_app/widgets/products/ProductState.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel(
      model: ProductScoppedModel(),
      child: MaterialApp(
//      home: Auth(),
        routes: {
          "/": (BuildContext context) => AuthStateFul(),
          "/productListing": (BuildContext context) => ProductState(),
          "/admin": (context) {
            return ManageProducts();
          },
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }

          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);

            return MaterialPageRoute<bool>(builder: (BuildContext context) {
              return DetailPage(index);
            });
          }

          if (pathElements[1] == 'updateProduct') {
            ProductModel product = settings.arguments;
            int postion = int.parse(pathElements[2]);
            return MaterialPageRoute(builder: (BuildContext context) {
              return UpdateProductSateFul(product, postion);
            });
          }

          return null;
        },
      ),
    );
  }
}
