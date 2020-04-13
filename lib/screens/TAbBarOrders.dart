import 'package:adminAppPandamic/screens/CompletedOrders.dart';
import 'package:adminAppPandamic/screens/viewOrders.dart';
import 'package:flutter/material.dart';

class OrdersTabBar extends StatefulWidget {
  static const routeName = '/orders-tabbar';

  @override
  _OrdersTabBarState createState() => _OrdersTabBarState();
}

class _OrdersTabBarState extends State<OrdersTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('ALL ORDERS'),
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.brown,
          ),
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                'ONGOING',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'COMPLETED',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: Container(
        width: double.infinity,
        child: TabBarView(
          children: [
            ViewOrders(),
            CompletedOrders(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
