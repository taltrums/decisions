import 'package:decisionsapp/pages/signoutpage.dart';
import 'package:decisionsapp/pages/homepage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text('!!!!');

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = HomePage();
        break;
      case 1:
        currentWidgetPage = SignOutPage();
        break;
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
      body: currentWidgetPage,
    );
  }
}
