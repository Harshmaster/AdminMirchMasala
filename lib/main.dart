import 'package:adminAppPandamic/screens/HomePage.dart';
import 'package:adminAppPandamic/screens/SearchOrders.dart';
import 'package:adminAppPandamic/screens/SingleProduct.dart';
import 'package:adminAppPandamic/screens/ViewUsers.dart';
import 'package:adminAppPandamic/screens/viewOrders.dart';
import 'package:flutter/material.dart';
import './screens/ViewProducts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        ProductListScreen.routeName: (ctx) => ProductListScreen(),
        SingleProduct.routeName: (ctx) => SingleProduct(),
        ViewUsers.routeName: (ctx) => ViewUsers(),
        ViewOrders.routeName: (ctx) => ViewOrders(),
        SearchOrders.routeName: (ctx) => SearchOrders(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
