import 'package:adminAppPandamic/screens/FetchedOrder.dart';
import 'package:flutter/material.dart';

class SearchOrders extends StatefulWidget {
  static const routeName = '/Search-Orders';
  @override
  _SearchOrdersState createState() => _SearchOrdersState();
}

class _SearchOrdersState extends State<SearchOrders> {
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text('Search an Order'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextField(
                  controller: idController,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    labelText: 'ENTER AN ORDER ID',
                    labelStyle: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  ),
                ),
                margin: EdgeInsets.only(left: 30, right: 30),
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                color: Colors.black,
                child: Text(
                  'SEARCH',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => FetchedOrder(
                                id: idController.text,
                              )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
