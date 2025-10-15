import 'package:flutter/material.dart';

import 'dashboard_screen.dart';
import 'my_account.dart' hide ProfileScreen;
import 'bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BottomNavBarScreen(),
    );
  }
}
