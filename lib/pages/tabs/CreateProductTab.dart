import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/Constants.dart';
import 'package:flutter_app/models/ProductModel.dart';
import 'package:flutter_app/scopped_models/ProductScoppedModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CreateProductState extends State<CreateProductStateFul> {
  ProductModel productModel =
      ProductModel(null, null, null, "assets/download.jpg", false);
  bool _isTermsAccepted = false;

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Form(
          key: _formState,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration:
                    getFieldsDecoration("Product Name", Icon(Icons.android)),
                style: getFieldsTextStyle(),
                validator: (String submittedValue) {
                  if (submittedValue.isEmpty) {
                    return 'Product name is required';
                  }
                },
                onSaved: (String productName) {
                  productModel.title = productName;
                },
              ),
              TextFormField(
                maxLines: 4,
                decoration: getFieldsDecoration(
                    "Product Description", Icon(Icons.description)),
                style: getFieldsTextStyle(),
                validator: (String submittedValue) {
                  if (submittedValue.isEmpty) {
                    return 'Product description is required';
                  }
                },
                onSaved: (String description) {
                  productModel.description = description;
                },
              ),
              TextFormField(
                  decoration:
                      getFieldsDecoration("Product Price", Icon(Icons.android)),
                  style: getFieldsTextStyle(),
                  keyboardType: TextInputType.number,
                  validator: (String submittedValue) {
                    if (submittedValue.isEmpty) {
                      return 'Product price is required';
                    }
                  },
                  onSaved: (String price) {
                    productModel.price = double.parse(price);
                  }),
              Container(
                child: SwitchListTile(
                  onChanged: (bool value) {
                    setState(() {
                      _isTermsAccepted = value;
                    });
                  },
                  value: _isTermsAccepted,
                  title: Text('Terms & Conditions'),
                  subtitle: Text(
                      'Please accept our terms & consitions in order to continue'),
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: ScopedModelDescendant<ProductScoppedModel>(
                  builder: (BuildContext context, Widget child,
                      ProductScoppedModel model) {
                    return _buildSaveButton(model);
                  },
                ),
              )
            ],
          ),
        ),
        margin: EdgeInsets.all(20.0),
      ),
    );
  }

  Widget _buildSaveButton(ProductScoppedModel model) {
    return RaisedButton(
      onPressed: () {
        if (_isTermsAccepted) {
          onClickSaveProduct(context, model);
        }
      },
      child: Text("Save Product"),
      elevation: 4.0,
      textColor: Colors.white,
      color: Theme.of(context).primaryColorDark,
    );
  }

  getFieldsDecoration(String hintText, Widget icon) {
    return InputDecoration(
        hintText: hintText, icon: icon, fillColor: Colors.white);
  }

  getFieldsTextStyle() {
    return TextStyle(
        color: Colors.black, fontSize: Constants.appFieldsStdTextSize);
  }

  void onClickSaveProduct(BuildContext context, ProductScoppedModel model) {
    if (_formState.currentState.validate()) {
      _formState.currentState.save();

      model.addProduct(productModel);

      Navigator.pushReplacementNamed(context, '/productListing');
    }
  }
}

class CreateProductStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateProductState();
  }
}
