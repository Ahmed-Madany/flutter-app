import 'package:flutter/material.dart';
import 'package:myapp/Screens/navigation_bar_screens/main_screen.dart';
import 'package:myapp/Screens/navigation_bar_screens/orders_screen.dart';
import 'package:myapp/Screens/navigation_bar_screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  const HomeScreen({super.key, required this.email});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> navigationbarscrrens = [
    MainScreen(),
    OrdersScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home Screen"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.exit_to_app),
        ),
      ),

      body: SafeArea(child: navigationbarscrrens[currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
