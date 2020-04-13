import 'package:adminAppPandamic/screens/ViewSingleOrder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FetchedOrder extends StatefulWidget {
  final String id;
  FetchedOrder({this.id});
  @override
  _FetchedOrderState createState() => _FetchedOrderState();
}

class _FetchedOrderState extends State<FetchedOrder> {
  List dropList = ['confirmed', 'delivered', 'ordered', 'On-The-Way'];
  String name = 'HARSH SINGH';
  int amount;
  String status;
  String vendor;
  int itemCount;
  String modeOfPayment;
  String _isCompleted = "not-completed";
  String orderId;
  String selectedUser;

  getData() async {
    await Firestore.instance
        .collection("orders")
        .document(widget.id)
        .get()
        .then((DocumentSnapshot docs) {
      if (docs.exists) {
        setState(() {
          name = docs["user_name"];
          amount = docs["order_amount"];
          status = docs["status"];
          vendor = docs["order_vendor"];
          itemCount = docs["order_count"];
          modeOfPayment = docs["mode_of_payment"];
          _isCompleted = 'completed';
          orderId = docs["order_id"];
          print(_isCompleted);
        });
      } else {
        setState(() {
          _isCompleted = 'no-order';
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Details'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _isCompleted == 'completed'
            ? InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SingleOrder(
                                id: orderId,
                              )));
                },
                child: Container(
                  height: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name : $name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Amount : Rs $amount",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        width: double.infinity,
                        height: 20,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 30,
                          underline: Container(
                            color: Colors.white,
                          ),
                          style: TextStyle(
                              color: Color.fromRGBO(82, 90, 101, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          hint: Text(
                            "Status : $status",
                            style: TextStyle(fontSize: 19),
                          ),
                          value: selectedUser,
                          onChanged: (String value) {
                            Firestore.instance
                                .collection("orders")
                                .document(orderId)
                                .updateData({"status": value.toString()});
                            setState(() {
                              selectedUser = value;
                            });
                          },
                          items: dropList.map(
                            (variable) {
                              return DropdownMenuItem<String>(
                                value: variable,
                                child: Container(
                                  child: Text(
                                    "Status : $variable",
                                    style: TextStyle(fontSize: 19),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Text(
                        "Vendor Name : $vendor",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "No of items : $itemCount",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mode of Payment : $modeOfPayment",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : _isCompleted == 'no-order'
                ? Center(
                    child: Text(
                    'NO ORDERS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                : SpinKitCircle(color: Colors.black));
  }
}
