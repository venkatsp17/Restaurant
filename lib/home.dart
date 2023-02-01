import 'package:flutter/material.dart';
import 'package:food/FRONTEND/ORDERS.dart';
import 'package:food/FRONTEND/MENU.dart';
import 'package:food/reviews.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  static const List _widgetOptions = [
    Menu(),
    Orders(),
    Reviews(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Color(0xff059DC0)),
            BottomNavigationBarItem(
                icon: Icon(Icons.food_bank_outlined),
                label: "Orders",
                backgroundColor: Color(0xff059DC0)),
            BottomNavigationBarItem(
                icon: Icon(Icons.reviews),
                label: "Reviews",
                backgroundColor: Color(0xff059DC0)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
