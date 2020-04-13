import 'package:adminAppPandamic/screens/SearchOrders.dart';
import 'package:adminAppPandamic/screens/TAbBarOrders.dart';
import 'package:adminAppPandamic/screens/ViewUsers.dart';

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
    routeAddress: OrdersTabBar.routeName,
  ),
    Category(
    title: 'Search Order',
    subTitle: 'HELLOHII',
    imgLink: 'assets/images/search-orders.png',
    routeAddress: SearchOrders.routeName,
  ),
];
