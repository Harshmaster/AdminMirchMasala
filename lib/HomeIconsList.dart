import 'package:adminAppPandamic/screens/ViewUsers.dart';
import 'package:adminAppPandamic/screens/viewOrders.dart';

import './models/HomeCategory.dart';
import './screens/ViewProducts.dart';

List<Category> categoryList = [
  Category(
    title: 'Add Product',
    subTitle: 'April , Monday',
    imgLink: 'assets/images/addProduct.png',
      
  ),
  Category(
    title: 'View Products',
    subTitle: 'April , Monday',
    imgLink: 'assets/images/viewProducts.png',
    routeAddress: ProductListScreen.routeName,
  ),
  Category(
    title: 'View Users',
    subTitle: 'HELLO',
    imgLink: 'assets/images/ViewUsers.png',
    routeAddress: ViewUsers.routeName,
  ),
  Category(
    title: 'View Orders',
    subTitle: 'HELLOHII',
    imgLink: 'assets/images/ViewOrders.png',
    routeAddress: ViewOrders.routeName,
  ),
];
