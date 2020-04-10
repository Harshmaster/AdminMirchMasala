import 'package:flutter/material.dart';
import '../widgets/HomeCard.dart';
import '../HomeIconsList.dart';

class HomePage extends StatelessWidget {

  static const routeName = '/HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 9),
                  child: Text(
                    'Mirch Masala', 
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 13),
              child: Icon(
                Icons.settings,
                size: 33,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 35,
        ),
        child: GridView(
          padding: EdgeInsets.all(0),
          children: categoryList.map((catData) {
            return HomeCard(
              title: catData.title,
              subTitle: catData.subTitle,
              image: catData.imgLink,
              routeAddress: catData.routeAddress,
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );


  }
}