import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool sales = false;
  bool newArrivals = false;
  bool deliveryStatusChanges = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Settings Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16), // Spacer between titles
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16), // Spacer between heading and text fields
            TextField(
              decoration: InputDecoration(
                hintText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16), // Spacer between text fields
            TextField(
              decoration: InputDecoration(
                hintText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16), // Spacer between text fields
            Text(
              'Password',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off), // To indicate password field
              ),
              obscureText: true, // To hide the password input
            ),
            SizedBox(height: 16), // Spacer between text fields
            Text(
              'Notifications',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SwitchListTile(
              title: Text('Sales'),
              value: sales,
              onChanged: (bool value) {
                setState(() {
                  sales = value;
                });
              },
              activeColor: Colors.green,
            ),
            SwitchListTile(
              title: Text('New arrivals'),
              value: newArrivals,
              onChanged: (bool value) {
                setState(() {
                  newArrivals = value;
                });
              },
              activeColor: Colors.green,
            ),
            SwitchListTile(
              title: Text('Delivery Status Changes'),
              value: deliveryStatusChanges,
              onChanged: (bool value) {
                setState(() {
                  deliveryStatusChanges = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
