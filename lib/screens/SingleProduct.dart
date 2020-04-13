import 'package:adminAppPandamic/models/product.dart';
import 'package:adminAppPandamic/screens/EditProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SingleProduct extends StatefulWidget {
  final String id;

  SingleProduct({this.id});

  static const routeName = '/single-product';
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var productId;
  List<Product> productDetails;

  getProductData() async {
    await Firestore.instance
        .collection("products")
        .document(widget.id)
        .get()
        .then((harsh) {
      setState(() {
        productDetails = List.generate(1, (index) {
          return Product(
            isRecommended: harsh["isRecommended"],
            productCategory: harsh["product_category"],
            productImageUrl: harsh["product_image_url"],
            productName: harsh["product_name"],
            productPrice: harsh["product_price"],
            productSize: harsh["product_size"],
            productVendor: harsh["product_vendor"],
          );
        });
      });
    });
  }

  @override
  void initState() {
    getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            actions: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => EditProduct(
                                  id: widget.id,
                                )));
                  },
                ),
              )
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Text('View Details'),
            backgroundColor: Colors.blue),
        body: productDetails != null
            ? InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.white,
                      border: Border.all(
                        width: 2,
                      )),
                  height: 500,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width - 250) / 2,
                            right:
                                (MediaQuery.of(context).size.width - 250) / 2,
                          ),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          width: 150,
                          height: 150,
                          child: Image.network(
                            productDetails[0].productImageUrl,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                        child: SizedBox(
                          height: 0,
                        ),
                      ),
                      Text(
                        'Item:    ${productDetails[0].productName}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Is Recommended:    ${productDetails[0].isRecommended.toString()}",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Category:    ${productDetails[0].productCategory}",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Price:    Rs ${productDetails[0].productPrice}",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Quantity:    ${productDetails[0].productSize}",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Product Vendor:    ${productDetails[0].productVendor}",
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              )
            : SpinKitCircle(color: Colors.black));
  }
}
