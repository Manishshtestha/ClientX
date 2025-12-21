import 'package:clientx/screens/client/add_project.dart';
import 'package:clientx/screens/client/add_task.dart';
import 'package:clientx/screens/client/profile.dart';
import 'package:flutter/material.dart';
import 'package:clientx/screens/client/client_homepage.dart';
import 'package:clientx/screens/client/notifications.dart';
import 'package:clientx/screens/client/analytics.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientBottomnav extends StatefulWidget {
  const ClientBottomnav({super.key});

  @override
  State<ClientBottomnav> createState() => _ClientBottomnavState();
}

class _ClientBottomnavState extends State<ClientBottomnav> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Center(child: ClientHomepage()),
    Center(child: AnalyticsScreen()),
    Center(child: Text('Projects')),
    Center(child: NotificationScreen()),
    Center(child: Profile()),
  ];

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create New',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF182C4C),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.work_outline, color: Colors.blue),
                ),
                title: Text(
                  'Add Project',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProjectScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.task_alt, color: Colors.orange),
                ),
                title: Text(
                  'Add Task',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTaskScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF182C4C),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF182C4C),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () => _showAddOptions(context),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
