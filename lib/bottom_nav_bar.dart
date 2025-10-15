import 'package:flutter/material.dart';
import 'package:responsive_dashboard/bids.dart';
import 'package:responsive_dashboard/order_page.dart';
import 'dashboard_screen.dart';
import 'portfolio_page.dart';
import 'my_account.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  List<Widget> get _screens => [
        DashboardScreen(),
        OrderPage(),
        PortfolioPage(),
        BidsScreen(),
        ProfileScreen()
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: "Watchlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: "Bids"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "EOP507"),
        ],
      ),
    );
  }
}
