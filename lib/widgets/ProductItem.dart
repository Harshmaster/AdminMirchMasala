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

          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleProduct(id:this.id)));
        
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                productName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Rs $price',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 10,
            )),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[200],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
