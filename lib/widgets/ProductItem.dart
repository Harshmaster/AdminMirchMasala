import 'package:adminAppPandamic/screens/SingleProduct.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final productName;
  final imageUrl;
  final price;
  final productSize;
  final String category;
  final String id;

  ProductItem(
      {this.productName,
      this.imageUrl,
      this.price,
      this.productSize,
      this.category,
      this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SingleProduct(id: this.id)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              width: double.infinity,
              height: 191,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 6, bottom: 3),
              child: Text(
                productName,
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ), 
              ),
            ),
            Text(
              'Rs $price',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 0,
            )),
            Container(
              width: double.infinity,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
