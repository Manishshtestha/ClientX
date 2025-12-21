import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminNotifications extends StatelessWidget {
  const AdminNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of notifications
    final List<Map<String, String>> notifications = [
      {
        'title': 'New Project Request',
        'message': 'Acme Corp requested a new project.',
        'time': '2 hrs ago',
        'type': 'project',
      },
      {
        'title': 'Task Completed',
        'message': 'Alice marked "Design Review" as done.',
        'time': '5 hrs ago',
        'type': 'task',
      },
      {
        'title': 'New Client',
        'message': 'Gamma Inc joined the platform.',
        'time': '1 day ago',
        'type': 'client',
      },
      {
        'title': 'System Update',
        'message': 'Maintenance scheduled for tonight.',
        'time': '2 days ago',
        'type': 'system',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182C4C),
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all, color: Colors.white),
            onPressed: () {
              // Mark all as read
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor: _getIconColor(
                  notification['type']!,
                ).withOpacity(0.1),
                child: Icon(
                  _getIcon(notification['type']!),
                  color: _getIconColor(notification['type']!),
                ),
              ),
              title: Text(
                notification['title']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xFF182C4C),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    notification['message']!,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification['time']!,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              isThreeLine: true,
              onTap: () {
                // Navigate to details
              },
            ),
          );
        },
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'project':
        return Icons.work;
      case 'task':
        return Icons.check_circle;
      case 'client':
        return Icons.person_add;
      case 'system':
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  Color _getIconColor(String type) {
    switch (type) {
      case 'project':
        return Colors.blue;
      case 'task':
        return Colors.green;
      case 'client':
        return Colors.purple;
      case 'system':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
