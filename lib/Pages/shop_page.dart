import 'package:flutter/material.dart';
import 'package:e_commerce/colors.dart';
import 'package:e_commerce/Widgets//women_category_screen.dart'; // Import the women category screen

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Categories')),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              // Handle back action
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Women'),
              Tab(text: 'Men'),
              Tab(text: 'Kids'),
            ],
            labelColor: AppColors.SecondaryColor,
            indicatorColor: AppColors.primaryColor,
          ),
        ),
        body: TabBarView(
          children: [
            WomenCategoryScreen(), // Use the WomenCategoryScreen widget here
            Center(child: Text('Men Category Content', style: TextStyle(fontSize: 24))),
            Center(child: Text('Kids Category Content', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}
