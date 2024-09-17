import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartController extends GetxController {
  var cartItems = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      var response = await http.get(Uri.parse('https://fakestoreapi.com/carts/1'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<dynamic> products = data['products'];
        for (var product in products) {
          product['title'] = product['title'] ?? 'Unknown Title';
          product['price'] = product['price'] ?? 0.0;
          product['image'] = product['image'] ?? '';
          product['size'] = product['size'] ?? 'Unknown';
        }
        cartItems.assignAll(products);
      }
    } catch (e) {
      // Handle error
      print("Error fetching cart items: $e");
    }
  }

  Future<void> addToCart(dynamic product) async {
    var index = cartItems.indexWhere((item) => item['productId'] == product['id']);
    if (index != -1) {
      // If the item is already in the cart, increase its quantity
      cartItems[index]['quantity'] += 1;
    } else {
      // If the item is not in the cart, add it with quantity 1
      product['quantity'] = 1;
      cartItems.add({'productId': product['id'], 'quantity': 1, ...product});
    }
    cartItems.refresh();
    await updateCart();
  }

  Future<void> increaseQuantity(int productId) async {
    var index = cartItems.indexWhere((item) => item['productId'] == productId);
    if (index != -1) {
      cartItems[index]['quantity'] += 1;
      cartItems.refresh();
      await updateCart();
    }
  }

  Future<void> decreaseQuantity(int productId) async {
    var index = cartItems.indexWhere((item) => item['productId'] == productId);
    if (index != -1 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity'] -= 1;
      cartItems.refresh();
      await updateCart();
    } else if (index != -1 && cartItems[index]['quantity'] == 1) {
      cartItems.removeAt(index);
      cartItems.refresh();
      await updateCart();
    }
  }

  Future<void> updateCart() async {
    try {
      await http.put(
        Uri.parse('https://fakestoreapi.com/carts/1'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'products': cartItems}),
      );
    } catch (e) {
      // Handle error
      print("Error updating cart: $e");
    }
  }
}
