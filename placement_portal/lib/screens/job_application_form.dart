import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobApplicationForm extends StatefulWidget {
  final String company;
  final String position;
  final String deadline;

  const JobApplicationForm({
    super.key, 
    required this.company, 
    required this.position, 
    required this.deadline
  });

  @override
  State<JobApplicationForm> createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  
  bool _isSubmitting = false;
  bool _hasResume = false;
  bool _hasCoverLetter = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _rollNoController.dispose();
    _cgpaController.dispose();
    _experienceController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  Future<void> _submitApplication() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));
        
        if (!mounted) return;
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Application for ${widget.position} at ${widget.company} submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        
        // Navigate back to home screen
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isSubmitting = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Application'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Job Details Card
              Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.company,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.position,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            'Application Deadline: ${widget.deadline}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              
              // Phone Field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              
              // Roll Number Field
              TextFormField(
                controller: _rollNoController,
                decoration: const InputDecoration(
                  labelText: 'Roll Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your roll number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              
              // CGPA Field
              TextFormField(
                controller: _cgpaController,
                decoration: const InputDecoration(
                  labelText: 'CGPA',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.grade),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your CGPA';
                  }
                  final cgpa = double.tryParse(value);
                  if (cgpa == null || cgpa < 0 || cgpa > 10) {
                    return 'Please enter a valid CGPA between 0 and 10';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Professional Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              
              // Experience Field
              TextFormField(
                controller: _experienceController,
                decoration: const InputDecoration(
                  labelText: 'Relevant Experience',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work),
                  hintText: 'Describe your relevant experience',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              
              // Skills Field
              TextFormField(
                controller: _skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.psychology),
                  hintText: 'List your relevant skills (e.g., Java, Python, React)',
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Documents',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              
              // Resume Upload
              Card(
                child: ListTile(
                  leading: const Icon(Icons.upload_file),
                  title: const Text('Upload Resume'),
                  subtitle: Text(_hasResume ? 'Resume uploaded' : 'PDF or DOCX format (Max 2MB)'),
                  trailing: _hasResume 
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.upload, color: Colors.blue),
                  onTap: () {
                    // In a real app, this would open a file picker
                    setState(() {
                      _hasResume = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Resume uploaded successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              
              // Cover Letter Upload
              Card(
                child: ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Upload Cover Letter (Optional)'),
                  subtitle: Text(_hasCoverLetter ? 'Cover letter uploaded' : 'PDF or DOCX format (Max 2MB)'),
                  trailing: _hasCoverLetter 
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.upload, color: Colors.blue),
                  onTap: () {
                    // In a real app, this would open a file picker
                    setState(() {
                      _hasCoverLetter = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cover letter uploaded successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitApplication,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: _isSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Submit Application'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}