import 'package:flutter/material.dart';
import 'my_orders_page.dart'; // Import the MyOrdersPage
import 'settings_page.dart'; // Import the SettingsPage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'My Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16), // Spacer to position the new column
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrdersPage()),
              );
            },
            child: Opacity(
              opacity: 0.9, // Initial opacity
              child: Container(
                width: 375,
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'My Orders',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.keyboard_arrow_right_sharp),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between the two rows
          Opacity(
            opacity: 0.9, // Initial opacity
            child: Container(
              width: 375,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Shipping Address',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between the two rows
          Opacity(
            opacity: 0.9, // Initial opacity
            child: Container(
              width: 375,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Payment methods',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between the two rows
          Opacity(
            opacity: 0.9, // Initial opacity
            child: Container(
              width: 375,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Promo codes',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between the two rows
          Opacity(
            opacity: 0.9, // Initial opacity
            child: Container(
              width: 375,
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'My reviews',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8), // Spacer between the two rows
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: Opacity(
              opacity: 0.9, // Initial opacity
              child: Container(
                width: 375,
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(Icons.keyboard_arrow_right_sharp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
