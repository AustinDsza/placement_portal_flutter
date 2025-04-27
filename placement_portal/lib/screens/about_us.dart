import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About DBIT Placement Portal'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  Text(
                    'DBIT',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Don Bosco Institute of Technology',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Placement Portal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Our Mission'),
            const SizedBox(height: 10),
            _buildSectionContent(
              'Our mission is to connect students with the best career opportunities by providing a streamlined platform for placement activities. We aim to bridge the gap between academic excellence and professional success.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('About the Portal'),
            const SizedBox(height: 10),
            _buildSectionContent(
              'The Placement Portal is designed to help students navigate the placement process efficiently. Our platform offers features such as company listings, placement statistics, and registration for placement drives.',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Contact Information'),
            const SizedBox(height: 10),
            _buildContactInfo(
              Icons.email,
              'Email',
              'placements@college.edu',
            ),
            const SizedBox(height: 10),
            _buildContactInfo(
              Icons.phone,
              'Phone',
              '+91 1234567890',
            ),
            const SizedBox(height: 10),
            _buildContactInfo(
              Icons.location_on,
              'Address',
              'College Campus, City - 123456',
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                '© 2023 Placement Portal. All rights reserved.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String detail) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              detail,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
