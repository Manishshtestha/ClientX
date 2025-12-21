import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminClients extends StatelessWidget {
  const AdminClients({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of clients
    final List<Map<String, String>> clients = [
      {'name': 'Acme Corp', 'email': 'contact@acme.com', 'status': 'Active'},
      {'name': 'Beta Ltd', 'email': 'info@beta.com', 'status': 'Inactive'},
      {'name': 'Gamma Inc', 'email': 'support@gamma.com', 'status': 'Active'},
      {'name': 'Delta Co', 'email': 'sales@delta.com', 'status': 'Active'},
      {
        'name': 'Epsilon LLC',
        'email': 'hello@epsilon.com',
        'status': 'Pending',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50], // Consistent light background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182C4C),
        title: Text(
          'Clients',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Add client action
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: clients.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final client = clients[index];
          final isStatusActive = client['status'] == 'Active';
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF182C4C).withOpacity(0.1),
                child: Text(
                  client['name']![0],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF182C4C),
                  ),
                ),
              ),
              title: Text(
                client['name']!,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xFF182C4C),
                ),
              ),
              subtitle: Text(
                client['email']!,
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isStatusActive
                      ? Colors.green.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  client['status']!,
                  style: GoogleFonts.poppins(
                    color: isStatusActive ? Colors.green : Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {
                // Navigate to client details
              },
            ),
          );
        },
      ),
    );
  }
}
