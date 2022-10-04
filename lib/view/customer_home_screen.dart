import 'package:flutter/material.dart';
import 'package:multivender_app/view/carts_screen.dart';
import 'package:multivender_app/view/home_screen.dart';
import 'package:multivender_app/view/inner_screen/profile_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  
  static const String routeName = 'CustomerHomeScreen';
  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedItem = 0;

  final List<Widget> _page = [
    HomeScreen(),
    Center(
      child: Text('Category Screen'),
    ),
    Center(
      child: Text('Shop Screen'),
    ),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.cyan,
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
      ),
      body: _page[_selectedItem],
    );
  }
}
