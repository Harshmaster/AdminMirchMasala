import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SingleOrder extends StatefulWidget {
  final id;
  static const routeName = '/view-single-order';
  SingleOrder({this.id});
  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.red[200],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("orders")
            .document(widget.id)
            .collection("items")
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        width: 100,
                        height: 100,
                        child: Image.network(
                          snapshot
                              .data.documents[index].data["product_image_url"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Product : ${snapshot.data.documents[index].data["product_name"]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Price : ${snapshot.data.documents[index].data["product_price"]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Quantity : ${snapshot.data.documents[index].data["product_qty"]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Vendor : ${snapshot.data.documents[index].data["vendor_name"]}",
                        style: TextStyle(
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
        },
      ),
    );
  }
}
