import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ViewUsers extends StatefulWidget {
  static const routeName = '/view-users';

  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('All users'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        width: 2,
                      )),
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Name : ${snapshot.data.documents[index].data["name"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Mobile : ${snapshot.data.documents[index].data["mobile_number"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Email : ${snapshot.data.documents[index].data["email"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
