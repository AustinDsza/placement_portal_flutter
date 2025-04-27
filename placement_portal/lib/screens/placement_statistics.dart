import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PlacementStatistics extends StatefulWidget {
  const PlacementStatistics({super.key});

  @override
  State<PlacementStatistics> createState() => _PlacementStatisticsState();
}

class _PlacementStatisticsState extends State<PlacementStatistics>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placement Statistics'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Department-wise'),
            Tab(text: 'Year-wise'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildDepartmentWiseTab(),
          _buildYearWiseTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Placement Overview 2024-25',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildStatCard(
            title: 'Total Students',
            value: '850',
            icon: Icons.people,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            title: 'Placed Students',
            value: '720',
            icon: Icons.work,
            color: Colors.green,
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            title: 'Placement Percentage',
            value: '84.7%',
            icon: Icons.percent,
            color: Colors.purple,
          ),
          const SizedBox(height: 10),
          _buildStatCard(
            title: 'Companies Visited',
            value: '125',
            icon: Icons.business,
            color: Colors.orange,
          ),
          const SizedBox(height: 20),
          const Text(
            'Salary Statistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSalaryRow('Highest Package', '₹42 LPA'),
                  const Divider(),
                  _buildSalaryRow('Average Package', '₹12.5 LPA'),
                  const Divider(),
                  _buildSalaryRow('Median Package', '₹10.2 LPA'),
                  const Divider(),
                  _buildSalaryRow('Lowest Package', '₹5.5 LPA'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Placement Distribution',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildDepartmentWiseTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Department-wise Placement Statistics',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.3,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      String department;
                      switch (group.x) {
                        case 0:
                          department = 'CSE';
                          break;
                        case 1:
                          department = 'IT';
                          break;
                        case 2:
                          department = 'ECE';
                          break;
                        case 3:
                          department = 'EEE';
                          break;
                        case 4:
                          department = 'ME';
                          break;
                        case 5:
                          department = 'CE';
                          break;
                        default:
                          department = '';
                      }
                      return BarTooltipItem(
                        '$department\n${rod.toY.round()}%',
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'CSE';
                            break;
                          case 1:
                            text = 'IT';
                            break;
                          case 2:
                            text = 'ECE';
                            break;
                          case 3:
                            text = 'EEE';
                            break;
                          case 4:
                            text = 'ME';
                            break;
                          case 5:
                            text = 'CE';
                            break;
                          default:
                            text = '';
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return const Text('');
                        }
                        return Text(
                          '${value.toInt()}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.5,
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 95,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 92,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 85,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 80,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 75,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        toY: 70,
                        color: Colors.blue,
                        width: 20,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Department-wise Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _buildDepartmentDetailCard(
            department: 'Computer Science',
            placementRate: '95%',
            avgPackage: '₹18.5 LPA',
            highestPackage: '₹42 LPA',
            totalStudents: 150,
            placedStudents: 142,
          ),
          const SizedBox(height: 10),
          _buildDepartmentDetailCard(
            department: 'Information Technology',
            placementRate: '92%',
            avgPackage: '₹16.8 LPA',
            highestPackage: '₹38 LPA',
            totalStudents: 120,
            placedStudents: 110,
          ),
          const SizedBox(height: 10),
          _buildDepartmentDetailCard(
            department: 'Electronics & Communication',
            placementRate: '85%',
            avgPackage: '₹12.5 LPA',
            highestPackage: '₹28 LPA',
            totalStudents: 130,
            placedStudents: 110,
          ),
        ],
      ),
    );
  }

  Widget _buildYearWiseTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Year-wise Placement Trends',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.5,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 20,
                  verticalInterval: 1,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = '2020';
                            break;
                          case 1:
                            text = '2021';
                            break;
                          case 2:
                            text = '2022';
                            break;
                          case 3:
                            text = '2023';
                            break;
                          case 4:
                            text = '2024';
                            break;
                          default:
                            text = '';
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) {
                          return const Text('');
                        }
                        return Text(
                          '${value.toInt()}%',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        );
                      },
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 75),
                      FlSpot(1, 78),
                      FlSpot(2, 80),
                      FlSpot(3, 82),
                      FlSpot(4, 85),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Year-wise Comparison',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _buildYearComparisonCard(
            year: '2024',
            placementRate: '85%',
            avgPackage: '₹12.5 LPA',
            companiesVisited: 125,
            highestPackage: '₹42 LPA',
          ),
          const SizedBox(height: 10),
          _buildYearComparisonCard(
            year: '2023',
            placementRate: '82%',
            avgPackage: '₹11.8 LPA',
            companiesVisited: 118,
            highestPackage: '₹38 LPA',
          ),
          const SizedBox(height: 10),
          _buildYearComparisonCard(
            year: '2022',
            placementRate: '80%',
            avgPackage: '₹10.5 LPA',
            companiesVisited: 105,
            highestPackage: '₹35 LPA',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              radius: 25,
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.orange,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  Widget _buildLegend() {
    return Column(
      children: [
        _buildLegendItem('IT & Software', Colors.blue),
        const SizedBox(height: 5),
        _buildLegendItem('Banking & Finance', Colors.green),
        const SizedBox(height: 5),
        _buildLegendItem('Manufacturing', Colors.orange),
        const SizedBox(height: 5),
        _buildLegendItem('Others', Colors.purple),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildDepartmentDetailCard({
    required String department,
    required String placementRate,
    required String avgPackage,
    required String highestPackage,
    required int totalStudents,
    required int placedStudents,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem('Placement Rate', placementRate),
                _buildDetailItem('Avg. Package', avgPackage),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem('Total Students', totalStudents.toString()),
                _buildDetailItem('Placed Students', placedStudents.toString()),
              ],
            ),
            const SizedBox(height: 10),
            _buildDetailItem('Highest Package', highestPackage),
          ],
        ),
      ),
    );
  }

  Widget _buildYearComparisonCard({
    required String year,
    required String placementRate,
    required String avgPackage,
    required int companiesVisited,
    required String highestPackage,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Year $year',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem('Placement Rate', placementRate),
                _buildDetailItem('Avg. Package', avgPackage),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem(
                    'Companies Visited', companiesVisited.toString()),
                _buildDetailItem('Highest Package', highestPackage),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
