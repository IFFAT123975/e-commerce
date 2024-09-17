import 'package:flutter/material.dart';
import 'package:e_commerce/Widgets/Delivered_orders_page.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Define the action for the search button here
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Orders',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            TabBar(
              tabs: [
                Tab(text: "Delivered"),
                Tab(text: "Processing"),
                Tab(text: "Cancelled"),
              ],
              labelColor: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  DeliveredOrdersPage(),
                  Center(child: Text('Processing Orders Content')),
                  Center(child: Text('Cancelled Orders Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
