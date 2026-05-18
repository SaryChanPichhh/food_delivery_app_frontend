import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:help_app_frontend/utils/constraint.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../widgets/sticky_search_menu_component.dart';

class DriverDashobardScreen extends StatefulWidget {
  DriverDashobardScreen({super.key});
  @override
  State<DriverDashobardScreen> createState() => _DriverDashobardScreenState();

  static Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    switch (value.toInt()) {
      case 0:
        return const Text('Mon', style: style);
      case 1:
        return const Text('Tue', style: style);
      case 2:
        return const Text('Wed', style: style);
      case 3:
        return const Text('Thu', style: style);
      default:
        return const Text('');
    }
  }
}

class _DriverDashobardScreenState extends State<DriverDashobardScreen> {
  PickerDateRange? _selectedRange;

  void _showRangePickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // ✅ radius here
        ),
        content: SizedBox(
          height: 350,
          width: 350,
          child: SfDateRangePicker(
            monthCellStyle: DateRangePickerMonthCellStyle(
              textStyle: TextStyle(),
            ),
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              setState(() {
                _selectedRange = args.value;
              });
            },
            cancelText: 'បោះបង់',
            selectionColor: primaryColor,
            startRangeSelectionColor: primaryColor,
            endRangeSelectionColor: primaryColor,
            confirmText: 'យល់ព្រម',
            showActionButtons: true,
            onSubmit: (value) => Navigator.pop(context),
            onCancel: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String rangeText = _selectedRange == null
        ? 'ជ្រើសរើសកាលបរិច្ខេទ'
        : '${_selectedRange!.startDate != null ? DateFormat('dd MMM yyyy').format(_selectedRange!.startDate!) : ''} - ${_selectedRange!.endDate != null ? DateFormat('dd MMM yyyy').format(_selectedRange!.endDate!) : DateFormat('dd MMM yyyy').format(_selectedRange!.startDate!)}';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: StickySearchBarDelegate(
                  widget: GestureDetector(
                    onTap: () {
                      _showRangePickerDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(rangeText),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _buildStatCard(
                      "សរុប",
                      "120",
                      Icons.delivery_dining,
                      Colors.green,
                    ),
                    _buildStatCard(
                      "Pending",
                      "8",
                      Icons.access_time,
                      Colors.orange,
                    ),
                    _buildStatCard(
                      "ទឹកប្រាក់",
                      "\$1,540",
                      Icons.monetization_on,
                      Colors.blue,
                    ),
                    _buildStatCard(
                      "វាយតម្លៃ",
                      "4.8 ★",
                      Icons.star,
                      Colors.purple,
                    ),

                    // Earnings Line Chart
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: _buildChartCard(
                        "Earnings Overview",
                        _earningsLineChart(),
                      ),
                    ),

                    // Delivery Performance
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: _buildChartCard(
                        "Delivery Performance",
                        _barChart(),
                      ),
                    ),

                    // Rating Breakdown Pie Chart
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: _buildChartCard("Rating Breakdown", _pieChart()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Statistic Card
  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Chart Card Wrapper
  Widget _buildChartCard(String title, Widget chart) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(height: 200, child: chart),
          ],
        ),
      ),
    );
  }

  // 📈 Line Chart for Earnings
  Widget _earningsLineChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blueAccent,
            barWidth: 4,
            spots: const [
              FlSpot(0, 1.2),
              FlSpot(1, 2.8),
              FlSpot(2, 1.8),
              FlSpot(3, 3.5),
              FlSpot(4, 4.2),
              FlSpot(5, 3.9),
              FlSpot(6, 4.8),
            ],
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blueAccent.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }

  // 📊 Bar Chart for Delivery Performance
  Widget _barChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(toY: 8, color: Colors.green)],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(toY: 6, color: Colors.orange)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [BarChartRodData(toY: 10, color: Colors.blue)],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [BarChartRodData(toY: 7, color: Colors.purple)],
          ),
        ],
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: DriverDashobardScreen._bottomTitles,
              reservedSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  // 🥧 Pie Chart for Rating Breakdown
  Widget _pieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(value: 60, color: Colors.green, title: '5★'),
          PieChartSectionData(value: 25, color: Colors.blue, title: '4★'),
          PieChartSectionData(value: 10, color: Colors.orange, title: '3★'),
          PieChartSectionData(value: 5, color: Colors.red, title: '2★'),
        ],
      ),
    );
  }
}
