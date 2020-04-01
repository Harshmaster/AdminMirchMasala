import 'package:adminAppPandamic/screens/ViewUsers.dart';
import 'package:adminAppPandamic/screens/viewOrders.dart';

import './models/HomeCategory.dart';
import './screens/ViewProducts.dart';

List<Category> categoryList = [
  Category(
    title: 'Add Product',
    subTitle: 'April , Monday',
    imgLink: 'assets/images/addIcon.png',
  ),
  Category(
    title: 'View Products',
    subTitle: 'April , Monday',
    imgLink: 'assets/images/AddCategory.png',
    routeAddress: ProductListScreen.routeName,
  ),
  Category(
    title: 'View Users',
    subTitle: 'HELLO',
    imgLink: ViewUsers.routeName,
    routeAddress: ViewUsers.routeName,
  ),
  Category(
    title: 'View Orders',
    subTitle: 'HELLOHII',
    imgLink: 'assets/images/createUser.png',
    routeAddress: ViewOrders.routeName,
  ),
  // Category(
  //   title: 'Orders',
  //   subTitle: 'April , Monday',
  //   imgLink: 'assets/images/addBusinessType.png',
  // ),
  // Category(
  //   title: 'User Permission',
  //   subTitle: 'April , Moncday',
  //   imgLink: 'assets/images/userPermission.png',
  // ),
];
