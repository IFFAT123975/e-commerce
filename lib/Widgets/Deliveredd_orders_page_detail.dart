import 'package:flutter/material.dart';

class DeliveredOrderDetailsPage extends StatelessWidget {
  final String orderTitle;
  final String orderDetails;
  final String tracking;
  final String quantity;
  final String totalAmount;
  final String status;

  DeliveredOrderDetailsPage({
    required this.orderTitle,
    required this.orderDetails,
    required this.tracking,
    required this.quantity,
    required this.totalAmount,
    required this.status,
  });

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
        title: Text('Order Details'),
        centerTitle: true,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$orderTitle',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date: 2024-06-01', // Dummy date
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8), // Spacer between title and details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$tracking',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '$status',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "$quantity",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 16), // Spacer before the card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Pullover.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16), // Spacer between image and text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pullover',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Color: Grey'),
                              Text('Size: L'),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Units: 1'),
                              Text('Price: \$40'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Spacer before the new text
            Text(
              'Order Information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Spacer between the title and order information
            Text(
              'Shipping Address: 123 Main Street, City, Country',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 8),
            Text(
              'Payment Method: Credit Card',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 8),
            Text(
              'Delivery Method: Standard Shipping',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 8),
            Text(
              'Discount: 10%',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 8),
            Text(
              'Total Amount: \$100',
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Reorder', style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Leave feedback', style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
