import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/Constants.dart';

class AuthStateFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Auth();
  }
}

class Auth extends State {
  var isAccepted = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop),
                image: AssetImage('assets/bg_login.jpg'))),
        child: Center(
          child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: Constants.MARGIN_TOP_BOTTOM_APP_STD,
                  horizontal: Constants.MARGIN_START_END_APP_STD),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    style: getFieldsTextStyle(),
                    decoration: getFieldsDecoration(
                        "Email",
                        Icon(
                          Icons.email,
                          color: Theme.of(context).accentColor,
                        )),
                  ),
                  TextField(
                    style: getFieldsTextStyle(),
                    obscureText: true,
                    decoration: getFieldsDecoration(
                        "Password",
                        Icon(Icons.email,
                            color: Theme.of(context).accentColor)),
                  ),
                  SwitchListTile(
                    value: isAccepted,
                    title: Text(
                      'Please accept our terms & conditions',
                      style: TextStyle(color: Colors.white),
                    ),
                    onChanged: (bool value) {
                      setState(() {
                        isAccepted = value;
                      });
                    },
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(4.0)),
                    margin: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/productListing');
                      },
                      textColor: Colors.white,
                      child: Text("Login"),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  getFieldsDecoration(String hintText, Widget icon) {
    return InputDecoration(
        hintText: hintText,
        icon: icon,
        hintStyle: TextStyle(color: Colors.white));
  }

  getFieldsTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 12);
  }
}
