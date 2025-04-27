import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // This would typically come from a user authentication system
  // For now, we'll use dummy data
  final Map<String, dynamic> _userData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'rollNumber': 'CS2023001',
    'department': 'Computer Science',
    'year': '3rd Year',
    'cgpa': '8.5',
    'profileImage': 'https://via.placeholder.com/150',
    'resume': 'resume.pdf',
    'skills': ['Flutter', 'Java', 'Python', 'SQL', 'Machine Learning'],
    'projects': [
      {
        'title': 'E-commerce App',
        'description': 'A mobile application for online shopping',
      },
      {
        'title': 'Weather Forecast',
        'description': 'An app that shows weather forecasts using API',
      },
    ],
  };

  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _cgpaController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _userData['name']);
    _emailController = TextEditingController(text: _userData['email']);
    _cgpaController = TextEditingController(text: _userData['cgpa']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cgpaController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      if (_isEditing) {
        // Save the data
        _userData['name'] = _nameController.text;
        _userData['email'] = _emailController.text;
        _userData['cgpa'] = _cgpaController.text;
      }
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildPersonalInfo(),
            const SizedBox(height: 20),
            _buildAcademicInfo(),
            const SizedBox(height: 20),
            _buildSkillsSection(),
            const SizedBox(height: 20),
            _buildProjectsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(_userData['profileImage']),
          ),
          const SizedBox(height: 10),
          _isEditing
              ? TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                )
              : Text(
                  _userData['name'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          const SizedBox(height: 5),
          Text(
            _userData['rollNumber'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(
              'Email',
              _isEditing
                  ? TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    )
                  : Text(_userData['email']),
            ),
            const Divider(),
            _buildInfoRow(
              'Department',
              Text(_userData['department']),
            ),
            const Divider(),
            _buildInfoRow(
              'Year',
              Text(_userData['year']),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAcademicInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Academic Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(
              'CGPA',
              _isEditing
                  ? TextField(
                      controller: _cgpaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    )
                  : Text(_userData['cgpa']),
            ),
            const Divider(),
            _buildInfoRow(
              'Resume',
              Row(
                children: [
                  Text(_userData['resume']),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      // Implement resume download functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Resume download started'),
                        ),
                      );
                    },
                    child: const Text('Download'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _userData['skills']
                  .map<Widget>((skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Colors.blue.shade100,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ..._userData['projects'].map<Widget>((project) {
              return ListTile(
                title: Text(
                  project['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(project['description']),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, Widget value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: value),
        ],
      ),
    );
  }
}
