import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProduct extends StatefulWidget {
  final String id;
  EditProduct({this.id});
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  bool selectedvalue;
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final vendorController = TextEditingController();
  String imageUrl;
  List<bool> dropList = [
    false,
    true,
  ];
  String selectedCat;
  List<String> catList = [
    'Snacks',
    'Beverages',
    'Spices',
    'Staples',
    'Cleaning',
    'Oils',
  ];

  getProductData() async {
    await Firestore.instance
        .collection("products")
        .document(widget.id)
        .get()
        .then((docs) async {
      setState(() {
        nameController.text = docs["product_name"];
        selectedvalue = docs["isRecommended"];
        selectedCat = docs["product_category"];
        categoryController.text = docs["product_category"];
        priceController.text = docs["product_price"];
        quantityController.text = docs["product_size"];
        vendorController.text = docs["product_vendor"];
        imageController.text = docs["product_image_url"];
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text('EDIT PRODUCT'),
        centerTitle: true,
      ),
      body: vendorController.text != null
          ? SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    // Container(
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   margin: EdgeInsets.only(top: 30),
                    //   width: 190,
                    //   height: 190,
                    //   child: ClipRRect(
                    //     child: Image.network(
                    //       imageUrl,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        controller: imageController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.image,
                              color: Colors.black,
                              size: 25,
                            ),
                            labelText: 'IMAGE URL',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.info,
                              color: Colors.black,
                              size: 25,
                            ),
                            labelText: 'PRODUCT NAME',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        controller: priceController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.attach_money,
                              color: Colors.black,
                              size: 25,
                            ),
                            labelText: 'PRICE',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        controller: quantityController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.line_weight,
                              color: Colors.black,
                              size: 25,
                            ),
                            labelText: 'QUANTITY',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        controller: vendorController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.business,
                              color: Colors.black,
                              size: 25,
                            ),
                            labelText: 'VENDOR',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ))),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: DropdownButton<bool>(
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
                        hint: Text("Status : $selectedvalue"),
                        value: selectedvalue,
                        onChanged: (bool value) {
                          setState(() {
                            selectedvalue = value;
                          });
                        },
                        items: dropList.map(
                          (bool variable) {
                            return DropdownMenuItem<bool>(
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
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                        hint: Text("Category : $selectedvalue"),
                        value: selectedCat,
                        onChanged: (String value) {
                          setState(() {
                            selectedCat = value;
                          });
                        },
                        items: catList.map(
                          (String variable) {
                            return DropdownMenuItem<String>(
                              value: variable,
                              child: Container(
                                child: Text(
                                  "Category : $variable",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: RaisedButton(
                        color: Colors.black,
                        child: Text('UPDATE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SpinKitCircle(color: Colors.white);
                              });
                          await Firestore.instance
                              .collection("products")
                              .document(widget.id)
                              .updateData({
                            "isRecommended": selectedvalue,
                            "product_name": nameController.text,
                            "product_price": priceController.text,
                            "product_size": quantityController.text,
                            "product_vendor": vendorController.text,
                            "category": selectedCat,
                            "product_image_url":imageController.text,
                          });

                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SpinKitCircle(color: Colors.black),
    );
  }
}
