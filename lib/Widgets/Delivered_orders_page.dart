import 'package:flutter/material.dart';
import 'package:e_commerce/Widgets/Deliveredd_orders_page_detail.dart';

class DeliveredOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> deliveredOrders = [
      {
        'title': 'Order No1947034',
        'details': 'Details of Order No1947034',
        'date': '2024-06-01',
        'tracking': 'Tracking number: 1W782354625',
        'quantity': 'Quantity: 1',
        'totalAmount': 'Total Amount: 112\$',
        'status': 'Delivered',
      },
    ];

    return ListView.builder(
      itemCount: deliveredOrders.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveredOrderDetailsPage(
                  orderTitle: deliveredOrders[index]['title']!,
                  orderDetails: deliveredOrders[index]['details']!,
                  tracking: deliveredOrders[index]['tracking']!, // Pass tracking
                  quantity: deliveredOrders[index]['quantity']!, // Pass quantity
                  totalAmount: deliveredOrders[index]['totalAmount']!, // Pass totalAmount
                  status: deliveredOrders[index]['status']!,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      deliveredOrders[index]['title']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      deliveredOrders[index]['date']!,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  deliveredOrders[index]['tracking']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      deliveredOrders[index]['quantity']!,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      deliveredOrders[index]['totalAmount']!,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeliveredOrderDetailsPage(
                              orderTitle: deliveredOrders[index]['title']!,
                              orderDetails: deliveredOrders[index]['details']!,
                              tracking: deliveredOrders[index]['tracking']!, // Pass tracking
                              quantity: deliveredOrders[index]['quantity']!, // Pass quantity
                              totalAmount: deliveredOrders[index]['totalAmount']!, // Pass totalAmount
                              status: deliveredOrders[index]['status']!,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Details',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                    Text(
                      deliveredOrders[index]['status']!,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
