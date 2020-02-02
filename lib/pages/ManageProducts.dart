import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/tabs/CreateProductTab.dart';
import 'package:flutter_app/pages/tabs/ProductListingTab.dart';

class ManageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text("Choose"),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  title: Text("Manage Product"),
                  subtitle: Text('Handy guide to manage products'),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: (Text("Manage Products Panel")),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.create), text: 'Create Product'),
                Tab(icon: Icon(Icons.edit), text: 'Edit Product')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[CreateProductStateFul(), ProductListingPage()],
          )),
    );
  }
}
