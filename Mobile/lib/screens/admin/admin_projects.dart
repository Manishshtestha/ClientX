import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminProjects extends StatelessWidget {
  const AdminProjects({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy list of projects
    final List<Map<String, dynamic>> projects = [
      {'title': 'Mobile App Redesign', 'client': 'Acme Corp', 'progress': 0.75},
      {
        'title': 'Web Portal Development',
        'client': 'Beta Ltd',
        'progress': 0.40,
      },
      {'title': 'Marketing Strategy', 'client': 'Gamma Inc', 'progress': 0.90},
      {'title': 'Database Migration', 'client': 'Delta Co', 'progress': 0.20},
      {'title': 'SEO Optimization', 'client': 'Epsilon LLC', 'progress': 0.60},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF182C4C),
        title: Text(
          'Projects',
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
              // Add project action
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final project = projects[index];
          final progress = project['progress'] as double;
          return Container(
            padding: const EdgeInsets.all(16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project['title'],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF182C4C),
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Client: ${project['client']}',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
