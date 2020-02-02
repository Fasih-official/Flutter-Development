import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/Constants.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:scoped_model/scoped_model.dart';

class UpdateProductSateFul extends StatefulWidget {
  ProductModel product;
  int position;

  UpdateProductSateFul(this.product, this.position) {
    this.product = product;
    this.position = position;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UpdateProduct(product: product, position: position);
  }
}

class UpdateProduct extends State<UpdateProductSateFul> {
  ProductModel product;

  bool _isAccepted = false;

  int position;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UpdateProduct({@required this.product, @required this.position});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Constants.MARGIN_START_END_APP_STD,
            vertical: Constants.MARGIN_TOP_BOTTOM_APP_STD),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                style: TextStyle(fontSize: Constants.appFieldsStdTextSize),
                initialValue: product.title.toString(),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Product name is required';
                  }
                },
                onSaved: (String submittedValue) {
                  product.title = submittedValue;
                },
                decoration: InputDecoration(
                    hintText: 'Product Name', icon: Icon(Icons.android)),
              ),
              TextFormField(
                style: TextStyle(fontSize: Constants.appFieldsStdTextSize),
                initialValue: product.description.toString(),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Product description is required';
                  }
                },
                onSaved: (String submittedValue) {
                  product.description = submittedValue;
                },
                decoration: InputDecoration(
                    hintText: 'Product Description', icon: Icon(Icons.android)),
              ),
              TextFormField(
                style: TextStyle(fontSize: Constants.appFieldsStdTextSize),
                initialValue: product.price.toString(),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Product price is required';
                  }
                },
                onSaved: (String submittedValue) {
                  product.price = double.parse(submittedValue);
                },
                decoration: InputDecoration(
                    hintText: 'Product Price', icon: Icon(Icons.android)),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: Constants.MARGIN_TOP_BOTTOM_APP_STD),
                child: SwitchListTile(
                  value: _isAccepted,
                  title: Text('Terms & Conditions'),
                  subtitle: Text(
                      'Please accept our terms & conditions in order to continue'),
                  onChanged: (bool value) {
                    setState(() {
                      _isAccepted = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: Constants.MARGIN_TOP_BOTTOM_APP_STD),
                child: ScopedModelDescendant<ProductScoppedModel>(
                  builder: (BuildContext context, Widget child,
                      ProductScoppedModel model) {
                    return _buildUpdateButton(model);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateButton(ProductScoppedModel model) {
    return RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            model.updateProduct(product, position);
            Navigator.pop(context);
          }
        },
        textColor: Colors.white,
        color: Theme.of(context).accentColor,
        child: Text('Update Product'));
  }
}
