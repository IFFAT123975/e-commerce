import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/Pages/signup.dart';
import 'package:e_commerce/widgets/product_details_page.dart';
import 'package:e_commerce/Pages/bag_details.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      getPages: [
        GetPage(name: '/', page: () => SignUpPage()),
        GetPage(
          name: '/product-details',
          page: () => ProductDetailsPage(
            product: const{
              'title': 'Sample Product',
              'image': 'https://via.placeholder.com/250',
              
              'description': 'This is a sample product description.',
              'price': 29.99,
              'rating': {'rate': 4.5, 'count': 10},
            },
          ),
        ),
        GetPage(name: '/bag-details', page: () => BagDetails()),
      ],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
