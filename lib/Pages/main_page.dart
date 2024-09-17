import 'package:e_commerce/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Pages/home_page.dart';
import 'package:e_commerce/Pages/shop_page.dart';
import 'package:e_commerce/Pages/profile_page.dart';
import 'package:e_commerce/Pages/favorites_page.dart';
import 'package:e_commerce/Pages/bag_details.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ShopPage(),
    Text('Bag Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BagDetails()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.UnselectedColor,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
