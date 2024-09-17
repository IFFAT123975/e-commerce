import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_commerce/Widgets/category_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _products = [];

  final List<Map<String, String>> _categories = [
    {
      'category': "men's clothing",
      'image': 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
    },
    {
      'category': "jewelery",
      'image': 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
    },
    {
      'category': "electronics",
      'image': 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
    },
    {
      'category': "women's clothing",
      'image': 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> allProducts = json.decode(response.body);
        setState(() {
          _products = allProducts.where((product) {
            return product['category'] == "men's clothing" ||
                product['category'] == "jewelery" ||
                product['category'] == "electronics" ||
                product['category'] == "women's clothing";
          }).toList();
        });
      } else {
        print('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _products.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 2 / 4,
          ),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryItem(
              _categories[index]['category']!,
              _categories[index]['image']!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String category, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsPage(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/placeholder.jpg', // Path to a local placeholder image
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black54,
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
