import 'package:adminAppPandamic/models/product.dart';
import 'package:flutter/material.dart';
import '../widgets/ProductItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = '/view-products';
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList;

  getProducts() async {
    Firestore.instance
        .collection("products")
        .getDocuments()
        .then((QuerySnapshot docs) {
      setState(() {
        productList = List.generate(docs.documents.length, (index) {
          return Product(
            productName: docs.documents[index].data["product_name"],
            productImageUrl: docs.documents[index].data["product_image_url"],
            productSize: docs.documents[index].data["product_size"],
            productPrice: docs.documents[index].data["product_price"],
            productCategory: docs.documents[index].data["product_category"],
            productId: docs.documents[index].data["product_id"],
          );
        });
      });
    });
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Text('ALL PRODUCTS'),
        ),
        body: productList != null
            ? GridView(
                padding: const EdgeInsets.all(10),        
                children: productList.map((Product catData) {
                  return ProductItem(
                    productName: catData.productName,
                    productSize: catData.productSize,
                    imageUrl: catData.productImageUrl,
                    price: catData.productPrice,
                    category: catData.productCategory,
                    id: catData.productId,
                  );
                }).toList(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.54, 
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,  
                ),
              )
            : SpinKitCircle(color: Colors.black));
  }
}
