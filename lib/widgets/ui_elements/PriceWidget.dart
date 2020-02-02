import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/Constants.dart';

class PriceWidget extends StatelessWidget {
  String _price;

  PriceWidget(this._price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(Constants.BORDER_RADIUS)),
      margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
      child: Text(
        '\$$_price',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
