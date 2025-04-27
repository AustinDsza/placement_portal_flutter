import 'package:flutter/material.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  final List<Map<String, dynamic>> _companies = [
    {
      'name': 'Google',
      'logo': 'assets/logos/google.png',
      'industry': 'Technology',
      'positions': ['Software Engineer', 'Product Manager', 'Data Scientist'],
      'package': '₹25-42 LPA',
      'eligibility': 'CGPA 8.0+',
      'description':
          'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, a search engine, cloud computing, software, and hardware.',
      'website': 'https://careers.google.com',
    },
    {
      'name': 'Microsoft',
      'logo': 'assets/logos/microsoft.png',
      'industry': 'Technology',
      'positions': ['Software Engineer', 'Cloud Solutions Architect', 'Program Manager'],
      'package': '₹20-38 LPA',
      'eligibility': 'CGPA 7.5+',
      'description':
          'Microsoft Corporation is an American multinational technology corporation which produces computer software, consumer electronics, personal computers, and related services.',
      'website': 'https://careers.microsoft.com',
    },
    {
      'name': 'Amazon',
      'logo': 'assets/logos/amazon.png',
      'industry': 'E-commerce, Cloud Computing',
      'positions': ['SDE', 'Business Analyst', 'Operations Manager'],
      'package': '₹18-35 LPA',
      'eligibility': 'CGPA 7.0+',
      'description':
          'Amazon.com, Inc. is an American multinational technology company focusing on e-commerce, cloud computing, digital streaming, and artificial intelligence.',
      'website': 'https://www.amazon.jobs',
    },
    {
      'name': 'Apple',
      'logo': 'assets/logos/apple.png',
      'industry': 'Technology, Consumer Electronics',
      'positions': ['iOS Developer', 'Hardware Engineer', 'Machine Learning Engineer'],
      'package': '₹22-40 LPA',
      'eligibility': 'CGPA 8.0+',
      'description':
          'Apple Inc. is an American multinational technology company that specializes in consumer electronics, software and online services.',
      'website': 'https://www.apple.com/careers',
    },
    {
      'name': 'Facebook (Meta)',
      'logo': 'assets/logos/meta.png',
      'industry': 'Social Media, Technology',
      'positions': ['Software Engineer', 'UX Researcher', 'Data Engineer'],
      'package': '₹24-40 LPA',
      'eligibility': 'CGPA 7.5+',
      'description':
          'Meta Platforms, Inc., doing business as Meta and formerly known as Facebook, Inc., is an American multinational technology conglomerate.',
      'website': 'https://www.metacareers.com',
    },
    {
      'name': 'IBM',
      'logo': 'assets/logos/ibm.png',
      'industry': 'Technology, Consulting',
      'positions': ['Software Developer', 'Consultant', 'Research Scientist'],
      'package': '₹12-25 LPA',
      'eligibility': 'CGPA 7.0+',
      'description':
          'International Business Machines Corporation is an American multinational technology corporation headquartered in Armonk, New York, with operations in over 171 countries.',
      'website': 'https://www.ibm.com/careers',
    },
    {
      'name': 'Infosys',
      'logo': 'assets/logos/infosys.png',
      'industry': 'IT Services, Consulting',
      'positions': ['Systems Engineer', 'Business Analyst', 'Technical Lead'],
      'package': '₹5-12 LPA',
      'eligibility': 'CGPA 6.0+',
      'description':
          'Infosys Limited is an Indian multinational information technology company that provides business consulting, information technology and outsourcing services.',
      'website': 'https://www.infosys.com/careers',
    },
    {
      'name': 'TCS',
      'logo': 'assets/logos/tcs.png',
      'industry': 'IT Services, Consulting',
      'positions': ['Assistant System Engineer', 'Digital Specialist', 'Research Associate'],
      'package': '₹3.5-10 LPA',
      'eligibility': 'CGPA 6.0+',
      'description':
          'Tata Consultancy Services Limited is an Indian multinational information technology services and consulting company headquartered in Mumbai.',
      'website': 'https://www.tcs.com/careers',
    },
    {
      'name': 'Wipro',
      'logo': 'assets/logos/wipro.png',
      'industry': 'IT Services, Consulting',
      'positions': ['Project Engineer', 'Technical Support', 'Business Analyst'],
      'package': '₹3.5-9 LPA',
      'eligibility': 'CGPA 6.0+',
      'description':
          'Wipro Limited is an Indian multinational corporation that provides information technology, consulting and business process services.',
      'website': 'https://careers.wipro.com',
    },
    {
      'name': 'Goldman Sachs',
      'logo': 'assets/logos/goldman.png',
      'industry': 'Banking, Finance',
      'positions': ['Financial Analyst', 'Technology Analyst', 'Operations Analyst'],
      'package': '₹20-35 LPA',
      'eligibility': 'CGPA 7.5+',
      'description':
          'The Goldman Sachs Group, Inc. is an American multinational investment bank and financial services company headquartered in New York City.',
      'website': 'https://www.goldmansachs.com/careers',
    },
    {
      'name': 'JPMorgan Chase',
      'logo': 'assets/logos/jpmorgan.png',
      'industry': 'Banking, Finance',
      'positions': ['Software Engineer', 'Financial Analyst', 'Risk Analyst'],
      'package': '₹16-30 LPA',
      'eligibility': 'CGPA 7.0+',
      'description':
          'JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City.',
      'website': 'https://careers.jpmorgan.com',
    },
    {
      'name': 'Deloitte',
      'logo': 'assets/logos/deloitte.png',
      'industry': 'Consulting, Professional Services',
      'positions': ['Analyst', 'Consultant', 'Advisory Associate'],
      'package': '₹8-18 LPA',
      'eligibility': 'CGPA 6.5+',
      'description':
          'Deloitte Touche Tohmatsu Limited is a multinational professional services network headquartered in London, England.',
      'website': 'https://www2.deloitte.com/careers',
    },
  ];

  String _searchQuery = '';
  String _selectedIndustry = 'All';
  final List<String> _industries = ['All', 'Technology', 'Banking, Finance', 'IT Services, Consulting', 'E-commerce', 'Consumer Electronics'];

  List<Map<String, dynamic>> get _filteredCompanies {
    return _companies.where((company) {
      final matchesSearch = company['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          company['positions'].any((position) => position.toLowerCase().contains(_searchQuery.toLowerCase()));
      
      final matchesIndustry = _selectedIndustry == 'All' || company['industry'].contains(_selectedIndustry);
      
      return matchesSearch && matchesIndustry;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search companies or positions...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _industries.length,
                    itemBuilder: (context, index) {
                      final industry = _industries[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(industry),
                          selected: _selectedIndustry == industry,
                          onSelected: (selected) {
                            setState(() {
                              _selectedIndustry = industry;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredCompanies.isEmpty
                ? const Center(
                    child: Text(
                      'No companies found',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _filteredCompanies.length,
                    itemBuilder: (context, index) {
                      final company = _filteredCompanies[index];
                      return _buildCompanyCard(company);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyCard(Map<String, dynamic> company) {
    return GestureDetector(
      onTap: () {
        _showCompanyDetails(company);
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.business,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                company['name'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                company['industry'],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                company['package'],
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _showCompanyDetails(company);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(30),
                ),
                child: const Text('View Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCompanyDetails(Map<String, dynamic> company) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(
                              Icons.business,
                              size: 50,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            company['name'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            company['industry'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    _buildDetailSection('About', company['description']),
                    const Divider(),
                    _buildDetailSection('Package', company['package']),
                    const Divider(),
                    _buildDetailSection('Eligibility', company['eligibility']),
                    const Divider(),
                    const Text(
                      'Open Positions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(
                      company['positions'].length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.work, size: 16, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text(company['positions'][index]),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to application form
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Application feature coming soon!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Apply Now'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Open company website
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Opening ${company['website']}'),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Visit Website'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}