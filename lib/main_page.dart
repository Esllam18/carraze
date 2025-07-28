import 'package:carraze/features/home/presentation/home_view_body.dart';

import 'package:carraze/features/home/presentation/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Assuming GoRouter for navigation

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      HomeBodyView(),
      Center(child: Text('Favorites')),
      Center(child: Text('Profile')),
      Center(child: Text('Search')),
    ];
    return Scaffold(
      drawer: CustomDrawer(
        onMenuItemTap: (route) {
          Navigator.pop(context);
          context.push(route); // Navigate to selected page
        },
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: botton_navigation_Bar(),
    );
  }

  BottomNavigationBar botton_navigation_Bar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFF2E4A62),
      unselectedItemColor: Colors.white70,
      onTap: _onItemTapped,
      backgroundColor: const Color(0xFF1C2526),
    );
  }
}
