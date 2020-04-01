
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final String routeAddress;
  

  HomeCard({this.title, this.subTitle, this.image, this.routeAddress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          routeAddress,
          arguments: {},
        );
      },
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.black,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 4,
        child: Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
              top: 0,
            ),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: 40,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 17),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                  child: Text(
                    '2 Events',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
