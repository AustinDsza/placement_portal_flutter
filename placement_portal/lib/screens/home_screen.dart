import 'package:flutter/material.dart';
import 'job_application_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DBIT Placement Portal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'DBIT Placement Portal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Don Bosco Institute of Technology',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Registration Form'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/registration');
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Placement Statistics'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/statistics');
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Company List'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/companies');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the DBIT Placement Portal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Placement Drives',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildPlacementDriveItem(
                      'Google',
                      'Software Engineer',
                      'May 15, 2025',
                      Icons.computer,
                    ),
                    const Divider(),
                    _buildPlacementDriveItem(
                      'Microsoft',
                      'Product Manager',
                      'May 20, 2025',
                      Icons.work,
                    ),
                    const Divider(),
                    _buildPlacementDriveItem(
                      'Amazon',
                      'Data Scientist',
                      'May 25, 2025',
                      Icons.analytics,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Placement Highlights',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildHighlightItem(
                      '95%',
                      'Placement Rate',
                      Icons.trending_up,
                      Colors.green,
                    ),
                    _buildHighlightItem(
                      '120+',
                      'Companies Visited',
                      Icons.business,
                      Colors.blue,
                    ),
                    _buildHighlightItem(
                      '₹18 LPA',
                      'Highest Package',
                      Icons.attach_money,
                      Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Important Announcements',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildAnnouncementItem(
                      'Pre-Placement Talk by Google',
                      'May 10, 2025 | 10:00 AM | Auditorium',
                    ),
                    const Divider(),
                    _buildAnnouncementItem(
                      'Resume Building Workshop',
                      'May 5, 2025 | 2:00 PM | Seminar Hall',
                    ),
                    const Divider(),
                    _buildAnnouncementItem(
                      'Mock Interview Sessions',
                      'May 7-8, 2025 | 9:00 AM - 5:00 PM | Placement Cell',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlacementDriveItem(
      String company, String position, String date, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobApplicationForm(
                company: company,
                position: position,
                deadline: date,
              ),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.blue),
          ),
          title: Text(company),
          subtitle: Text(position),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'Apply Now',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightItem(
      String value, String label, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
