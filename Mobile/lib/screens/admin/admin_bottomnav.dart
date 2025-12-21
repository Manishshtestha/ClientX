import 'package:clientx/screens/admin/admin_analytics.dart';
import 'package:clientx/screens/admin/admin_clients.dart';
import 'package:clientx/screens/admin/admin_homepage.dart';
import 'package:clientx/screens/admin/admin_notifications.dart';
import 'package:clientx/screens/admin/admin_projects.dart';
import 'package:flutter/material.dart';

class AdminBottomNav extends StatefulWidget {
  const AdminBottomNav({super.key});

  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    AdminHomePage(),
    AdminAnalytics(),
    AdminClients(),
    // Center(child: Text('Tasks')),
    AdminProjects(),
    AdminNotifications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF182C4C),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Clients'),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.task),
          //   label: 'Tasks',
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
