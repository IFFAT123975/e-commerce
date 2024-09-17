import 'package:flutter/material.dart';
import 'package:e_commerce/colors.dart';

class WomenCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imageTitles = [
      'SUMMER SALES',
      'New',
      'Clothes',
      'Shoes',
      'Accessories',
    ];
    List<String> imagePaths = [
      'assets/images/Rectangle 3.png',
      'assets/images/New.png',
      'assets/images/Clothes.png',
      'assets/images/Shoes.png',
      'assets/images/Accesories.png',
    ];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildCategoryItemWithText(imagePaths[index], imageTitles[index]);
                } else {
                  return _buildCategoryItem(imagePaths[index], imageTitles[index], index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String imagePath, String title, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: index == 0 ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index == 0 ? 8.0 : 0.0),
                  bottomLeft: Radius.circular(index == 0 ? 8.0 : 0.0),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItemWithText(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.primaryColor,
              border: Border.all(color: Colors.black26),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
