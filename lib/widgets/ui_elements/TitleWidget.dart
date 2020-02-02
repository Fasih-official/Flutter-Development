import 'package:flutter/cupertino.dart';

class TitleWidget extends StatelessWidget {
  String _title;

  TitleWidget(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Text(
        _title,
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
      ),
    );
  }
}
