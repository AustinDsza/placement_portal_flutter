import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cgpaController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  String _selectedBranch = 'Computer Science';
  String _selectedYear = '4th Year';
  bool _isPlacementInterested = true;
  bool _isSubmitting = false;
  DateTime? _selectedDate;

  final List<String> _branches = [
    'Computer Science',
    'Information Technology',
    'Electronics',
    'Electrical',
    'Mechanical',
    'Civil',
    'Chemical',
  ];

  final List<String> _years = [
    '1st Year',
    '2nd Year',
    '3rd Year',
    '4th Year',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _rollNoController.dispose();
    _dobController.dispose();
    _cgpaController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        // Firebase functionality is temporarily disabled
        // await FirebaseFirestore.instance.collection('students').add({
        //   'name': _nameController.text,
        //   'email': _emailController.text,
        //   'phone': _phoneController.text,
        //   'rollNo': _rollNoController.text,
        //   'dob': _dobController.text,
        //   'branch': _selectedBranch,
        //   'year': _selectedYear,
        //   'cgpa': double.parse(_cgpaController.text),
        //   'address': _addressController.text,
        //   'isPlacementInterested': _isPlacementInterested,
        //   'registrationDate': FieldValue.serverTimestamp(),
        // });

        // Simulate a delay for demonstration purposes
        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration successful! (Firebase disabled)'),
              backgroundColor: Colors.green,
            ),
          );

          // Clear form
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _rollNoController.clear();
          _dobController.clear();
          _cgpaController.clear();
          _addressController.clear();
          setState(() {
            _selectedBranch = 'Computer Science';
            _selectedYear = '4th Year';
            _isPlacementInterested = true;
            _selectedDate = null;
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
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
        title: const Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Student Registration',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
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
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Academic Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
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
              DropdownButtonFormField<String>(
                value: _selectedBranch,
                decoration: const InputDecoration(
                  labelText: 'Branch',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                items: _branches.map((branch) {
                  return DropdownMenuItem<String>(
                    value: branch,
                    child: Text(branch),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBranch = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your branch';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedYear,
                decoration: const InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_view_month),
                ),
                items: _years.map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
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
                'Additional Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: const Text('Interested in Placement'),
                value: _isPlacementInterested,
                onChanged: (value) {
                  setState(() {
                    _isPlacementInterested = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: _isSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Submit Registration'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
