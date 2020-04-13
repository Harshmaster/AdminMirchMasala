import 'package:adminAppPandamic/screens/ViewSingleOrder.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Order {
  final String name;
  final int price;
  final String status;
  final String vendor;
  final int itemCount;
  final String modeofpayment;
  final String user_id;

  Order(
      {this.name,
      this.itemCount,
      this.modeofpayment,
      this.status,
      this.price,
      this.vendor,
      this.user_id});
}

class ViewOrders extends StatefulWidget {
  static const routeName = '/view-orders';

  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  List dropList = ['confirmed', 'delivered', 'ordered', 'On-The-Way'];
  var selectedUser;
  List<Order> orderedList;

  bool isCompleted = false;

  getData() async {
    await Firestore.instance
        .collection("orders")
        .where("status", isEqualTo: 'ordered')
        .getDocuments()
        .then((QuerySnapshot docs) {
      orderedList = List.generate(docs.documents.length, (index) {
        return Order(
          name: docs.documents[index].data["user_name"],
          itemCount: docs.documents[index].data["order_count"],
          modeofpayment: docs.documents[index].data["mode_of_payment"],
          price: docs.documents[index].data["order_amount"],
          status: docs.documents[index].data["status"],
          vendor: docs.documents[index].data["order_vendor"],
          user_id: docs.documents[index].data["order_id"],
        );
      });
    }).then((value) async {
      await Firestore.instance
          .collection("orders")
          .where("status", isEqualTo: 'confirmed')
          .getDocuments()
          .then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          orderedList.add(Order(
            name: docs.documents[i].data["user_name"],
            itemCount: docs.documents[i].data["order_count"],
            modeofpayment: docs.documents[i].data["mode_of_payment"],
            price: docs.documents[i].data["order_amount"],
            status: docs.documents[i].data["status"],
            vendor: docs.documents[i].data["order_vendor"],
            user_id: docs.documents[i].data["order_id"],
          ));
        }
      });
    }).then((value) async {
      await Firestore.instance
          .collection("orders")
          .where("status", isEqualTo: 'On-The-Way')
          .getDocuments()
          .then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; i++) {
          orderedList.add(Order(
            name: docs.documents[i].data["user_name"],
            itemCount: docs.documents[i].data["order_count"],
            modeofpayment: docs.documents[i].data["mode_of_payment"],
            price: docs.documents[i].data["order_amount"],
            status: docs.documents[i].data["status"],
            vendor: docs.documents[i].data["order_vendor"],
            user_id: docs.documents[i].data["order_id"],
          ));
        }
        setState(() {
          isCompleted = true;
        });
      });
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
        backgroundColor: Colors.grey[200],
        body: isCompleted
            ? orderedList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderedList.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        itemCount: orderedList[index].itemCount,
                        modeofpayment: orderedList[index].modeofpayment,
                        price: orderedList[index].price,
                        name: orderedList[index].name,
                        status: orderedList[index].status,
                        user_id: orderedList[index].user_id,
                        vendor: orderedList[index].vendor,
                        getData: getData,
                      );
                    },
                  )
                : Center(
                    child: Text(
                    'NO ONGOING ORDERS',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ))
            : SpinKitCircle(color: Colors.black));
  }
}

class OrderCard extends StatefulWidget {
  final String name;
  final int price;
  String status;
  final String vendor;
  final int itemCount;
  final String modeofpayment;
  final String user_id;
  Function getData;

  OrderCard({
    this.name,
    this.itemCount,
    this.modeofpayment,
    this.status,
    this.price,
    this.vendor,
    this.user_id,
    this.getData
  });

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  List dropList = ['confirmed', 'delivered', 'ordered', 'On-The-Way'];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SingleOrder(
                      id: widget.user_id,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2),
        ),
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name : ${widget.name}",
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
              "Amount : Rs ${widget.price.toString()}",
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
                hint: Text("Status : ${widget.status}",
                    style: TextStyle(fontSize: 19)),
                value: widget.status,
                onChanged: (String value) async {
                  Firestore.instance
                      .collection("orders")
                      .document(widget.user_id)
                      .updateData({"status": value.toString()});
                  setState(() {
                    widget.status = value;
                    widget.getData();
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
              "Vendor Name : ${widget.vendor}",
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
              "No of items : ${widget.itemCount.toString()}",
              style: TextStyle(
                color: Colors.brown,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mode of Payment : ${widget.modeofpayment}",
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
  }
}
