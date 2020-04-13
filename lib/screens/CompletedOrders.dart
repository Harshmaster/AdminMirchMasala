import 'package:adminAppPandamic/screens/ViewSingleOrder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompletedOrders extends StatefulWidget {
  static const routeName = '/view-orders';

  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  List dropList = ['confirmed', 'delivered', 'ordered', 'On-The-Way'];
  var selectedUser;
  static int listLength;
  List<String> arrayList;

  void getLength(int length) {
    listLength = length;

    List<String> localList = List.generate(listLength, (index) {
      print(listLength);
      return '';
    });

    arrayList = localList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("orders")
            .where("status", isEqualTo: "delivered")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            getLength(snapshot.data.documents.length);

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SingleOrder(
                                  id: snapshot
                                      .data.documents[index].data["order_id"],
                                )));
                  },
                  child: Container(
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
                          "Name : ${snapshot.data.documents[index].data["user_name"]}",
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
                          "Amount : Rs ${snapshot.data.documents[index].data["order_amount"]}",
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
                              "Status : ${snapshot.data.documents[index].data["status"]}",
                              style: TextStyle(fontSize: 19),
                            ),
                            onChanged: (String value) {
                              Firestore.instance
                                  .collection("orders")
                                  .document(snapshot
                                      .data.documents[index].data["order_id"])
                                  .updateData({"status": value.toString()});
                              setState(() {
                                arrayList.insert(index, 'value');
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
                          "Vendor Name : ${snapshot.data.documents[index].data["vendor_name"]}",
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
                          "No of items : ${snapshot.data.documents[index].data["order_count"]}",
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
                          "Mode of Payment : ${snapshot.data.documents[index].data["mode_of_payment"]}",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return SpinKitCircle(color: Colors.red);
          }
        },
      ),
    );
  }
}
