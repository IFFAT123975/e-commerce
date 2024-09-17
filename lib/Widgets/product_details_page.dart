import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/colors.dart';
import 'package:e_commerce/Pages/bag_details.dart';

class ProductDetailsPage extends StatelessWidget {
  final dynamic product;
  final CartController cartController = Get.put(CartController());

  ProductDetailsPage({required this.product});

  static const primaryColor = Color(0xFFDB3022);

  @override
  Widget build(BuildContext context) {
    String title = product['title'];
    List<String> titleWords = title.split(' ');
    String truncatedTitle = titleWords.length > 1 ? '${titleWords[0]} ${titleWords[1]}' : title;

    return Scaffold(
      appBar: AppBar(
        title: Text(truncatedTitle),
        actions: [
          Obx(() {
            return IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  if (cartController.cartItems.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cartController.cartItems.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                Get.to(() => BagDetails());
              },
            );
          }),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '\$${product['price']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 4),
                Text(
                  '${product['rating']['rate']} (${product['rating']['count']} reviews)',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return AddToCartBottomSheet(product: product);
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartBottomSheet extends StatefulWidget {
  final dynamic product;

  AddToCartBottomSheet({required this.product});

  @override
  _AddToCartBottomSheetState createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  String selectedSize = 'M';
  int quantity = 1;

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Size',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: ['XS', 'S', 'M', 'L'].map((size) {
              return ChoiceChip(
                label: Text(size),
                selected: selectedSize == size,
                onSelected: (selected) {
                  setState(() {
                    selectedSize = size;
                  });
                },
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text(
            'Select Quantity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              Text(
                quantity.toString(),
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart({
                    ...widget.product,
                    'size': selectedSize,
                    'quantity': quantity,
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
