import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add search functionality here
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Favorites',
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TabBar(
                  unselectedLabelColor: Colors.white, // Unselected text color
                  labelPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Summer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'T-Shirts',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Shirts',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Center(child: Text('Summer Items')),
                      Center(child: Text('T-Shirts Items')),
                      Center(child: Text('Shirts Items')),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 140,
              left: 15,
              child: Opacity(
                opacity: 1.0, // Set to 1.0 to make the image visible
                child: Image.asset(
                  'assets/images/Favorites.png',
                  width: 345,
                  height: 581,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
