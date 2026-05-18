import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/constraint.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  DateTimeRange? _selectedDateRange;

  @override
  void initState() {
    super.initState();
    // Default to last 7 days
    _selectedDateRange = DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 7)),
      end: DateTime.now(),
    );
  }

  Future<void> _pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDateRange,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          'ផ្ផ្ទាំងគ្រប់គ្រងអភិបាល',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => Get.toNamed(AppRoutes.adminNotification),
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterHeader(),
            const SizedBox(height: 16),
            _buildStatGrid(),
            const SizedBox(height: 24),
            _buildChartsSection(),
            const SizedBox(height: 24),
            _buildDataGridsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterHeader() {
    String dateLabel = 'ជ្រើសរើសកាលបរិច្ឆេទ';
    if (_selectedDateRange != null) {
      dateLabel =
          '${_selectedDateRange!.start.toString().split(' ')[0]} - ${_selectedDateRange!.end.toString().split(' ')[0]}';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'ទិដ្ឋភាពទូទៅ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: _pickDateRange,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: primaryColor),
                const SizedBox(width: 8),
                Text(
                  dateLabel,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 18, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        _buildStatCard('ហាងសរុប', '128', Icons.restaurant, Colors.blue),
        _buildStatCard('មុខម្ហូបពេញនិយម', '45', Icons.fastfood, Colors.orange),
        _buildStatCard(
          'កម្រៃជើងសារសរុប',
          '\$1,240',
          Icons.payments,
          Colors.green,
        ),
        _buildStatCard(
          'វិក្កយបត្រសរុប',
          '850',
          Icons.description,
          Colors.purple,
        ),
        _buildStatCard('អតិថិជនសរុប', '3,200', Icons.people, Colors.teal),
        _buildStatCard(
          'កំពុងដឹកជញ្ជូន',
          '12',
          Icons.delivery_dining,
          Colors.red,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Icon(Icons.trending_up, color: Colors.green, size: 16),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ការវិភាគការលក់',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 250,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
              text: 'ចំណូលប្រចាំសប្តាហ៍',
              textStyle: const TextStyle(fontSize: 12),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_SalesData, String>>[
              ColumnSeries<_SalesData, String>(
                dataSource: [
                  _SalesData('ច័ន្ទ', 35),
                  _SalesData('អង្គារ', 28),
                  _SalesData('ពុធ', 34),
                  _SalesData('ព្រហ', 32),
                  _SalesData('សុក្រ', 40),
                  _SalesData('សៅរ៍', 45),
                  _SalesData('អាទិត្យ', 30),
                ],
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                color: primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'ហាងដែលលក់ដាច់បំផុតប្រចាំថ្ងៃ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 300,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
              text: 'ការកម្ម៉ង់តាមហាង (Daily)',
              textStyle: const TextStyle(fontSize: 12),
            ),
            legend: Legend(isVisible: true, position: LegendPosition.bottom),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<_ResDailyData, String>>[
              StackedColumnSeries<_ResDailyData, String>(
                dataSource: _getResDailyData(),
                xValueMapper: (_ResDailyData data, _) => data.day,
                yValueMapper: (_ResDailyData data, _) => data.pizzaHut,
                name: 'Pizza Hut',
                color: Colors.redAccent,
              ),
              StackedColumnSeries<_ResDailyData, String>(
                dataSource: _getResDailyData(),
                xValueMapper: (_ResDailyData data, _) => data.day,
                yValueMapper: (_ResDailyData data, _) => data.kfc,
                name: 'KFC',
                color: Colors.orangeAccent,
              ),
              StackedColumnSeries<_ResDailyData, String>(
                dataSource: _getResDailyData(),
                xValueMapper: (_ResDailyData data, _) => data.day,
                yValueMapper: (_ResDailyData data, _) => data.lotteria,
                name: 'Lotteria',
                color: Colors.amber,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'ការវិភាគកម្រៃជើងសារ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SfCircularChart(
                  title: ChartTitle(
                    text: 'ចំណែកកម្រៃតាមហាង',
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.bottom,
                  ),
                  series: <CircularSeries<_ResCommissionData, String>>[
                    DoughnutSeries<_ResCommissionData, String>(
                      dataSource: [
                        _ResCommissionData('Pizza Hut', 450, Colors.redAccent),
                        _ResCommissionData('KFC', 380, Colors.orangeAccent),
                        _ResCommissionData('Lotteria', 320, Colors.amber),
                        _ResCommissionData('Other', 210, Colors.grey),
                      ],
                      xValueMapper: (_ResCommissionData data, _) => data.name,
                      yValueMapper: (_ResCommissionData data, _) => data.amount,
                      pointColorMapper: (_ResCommissionData data, _) =>
                          data.color,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                      innerRadius: '60%',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 6,
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(
                    text: 'និន្នាការកម្រៃប្រចាំថ្ងៃ',
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_SalesData, String>>[
                    SplineSeries<_SalesData, String>(
                      dataSource: [
                        _SalesData('08 May', 120),
                        _SalesData('09 May', 150),
                        _SalesData('10 May', 110),
                        _SalesData('11 May', 180),
                        _SalesData('12 May', 200),
                        _SalesData('13 May', 240),
                        _SalesData('14 May', 210),
                      ],
                      xValueMapper: (_SalesData data, _) => data.year,
                      yValueMapper: (_SalesData data, _) => data.sales,
                      name: 'Commission',
                      color: Colors.green,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<_ResDailyData> _getResDailyData() {
    // Mocking data based on filtered range (simple mockup for demo)
    return [
      _ResDailyData('08 May', 12, 10, 8),
      _ResDailyData('09 May', 15, 12, 10),
      _ResDailyData('10 May', 10, 8, 12),
      _ResDailyData('11 May', 18, 14, 9),
      _ResDailyData('12 May', 20, 15, 11),
      _ResDailyData('13 May', 25, 18, 14),
      _ResDailyData('14 May', 22, 20, 13),
    ];
  }

  Widget _buildDataGridsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ហាងដែលលក់ដាច់បំផុត',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SfDataGrid(
              source: _TopResDataSource(),
              columnWidthMode: ColumnWidthMode.fill,
              columns: [
                GridColumn(
                  columnName: 'name',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ឈ្មោះហាង',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'orders',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: const Text(
                      'ការកម្ម៉ង់',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'revenue',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'ចំណូល',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'commission',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'កម្រៃជើងសារ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'វិក្កយបត្រថ្មីៗ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SfDataGrid(
              source: _RecentInvoiceDataSource(),
              columnWidthMode: ColumnWidthMode.fill,
              columns: [
                GridColumn(
                  columnName: 'id',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ID',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'customer',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'អតិថិជន',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'amount',
                  label: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'ចំនួន',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 104),
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
            color: primaryColor,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                  ),
                ),
                const SizedBox(width: 13),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'សូមស្វារគមន៍',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      'Sary ChanPich',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white24, height: 1),
          _buildDrawerItem(
            icon: Icons.pie_chart_sharp,
            title: "ផ្ទាំងគ្រប់គ្រង",
            route: AppRoutes.adminDashboard,
            onTap: () => Navigator.pop(context),
          ),
          _buildDrawerItem(
            icon: Icons.menu_book_outlined,
            title: "ម៊ឺនុយ",
            route: AppRoutes.adminMenu,
            onTap: () => Get.toNamed(AppRoutes.adminMenu),
          ),
          _buildDrawerItem(
            icon: Icons.compare_rounded,
            title: "ភោជនីយដ្ខាន",
            route: AppRoutes.adminRes,
            onTap: () => Get.toNamed(AppRoutes.adminRes),
          ),
          _buildDrawerItem(
            icon: Icons.delivery_dining,
            title: "អ្នកដឹកជញ្ជូន",
            route: AppRoutes.adminDelivery,
            onTap: () => Get.toNamed(AppRoutes.adminDelivery),
          ),
          _buildExpansionItem(
            icon: Icons.manage_accounts,
            title: "គ្រប់គ្រង",
            children: [
              _buildDrawerItem(
                icon: Icons.person,
                title: "អតិថិជន",
                route: AppRoutes.adminUser,
                onTap: () => Get.toNamed(AppRoutes.adminUser),
              ),
              _buildDrawerItem(
                icon: Icons.badge,
                title: "បុគ្កលិក",
                route: AppRoutes.adminStaff,
                onTap: () => Get.toNamed(AppRoutes.adminStaff),
              ),
            ],
          ),
          _buildExpansionItem(
            icon: Icons.confirmation_number,
            title: "គូប៉ុង",
            children: [
              _buildDrawerItem(
                icon: Icons.discount,
                title: "កំណត់គូប៉ុង",
                route: AppRoutes.adminCoupon,
                onTap: () => Get.toNamed(AppRoutes.adminCoupon),
              ),
              _buildDrawerItem(
                icon: Icons.assignment_turned_in,
                title: "ផ្ដល់ប័ណ្ណបញ្ចុះតម្លៃ",
                route: AppRoutes.adminCouponAssign,
                onTap: () => Get.toNamed(AppRoutes.adminCouponAssign),
              ),
            ],
          ),
          _buildExpansionItem(
            icon: Icons.settings,
            title: "ការកំណត់",
            children: [
              _buildDrawerItem(
                icon: Icons.currency_exchange,
                title: "អត្រាការប្រាក់",
                route: AppRoutes.adminExchange,
                onTap: () => Get.toNamed(AppRoutes.adminExchange),
              ),
              _buildDrawerItem(
                icon: Icons.reviews,
                title: "ការវាយតម្លៃ",
                route: '/admin-reports',
                onTap: () => Get.toNamed('/admin-reports'),
              ),
              _buildDrawerItem(
                icon: Icons.security,
                title: "ការអនុញ្ញាតិ",
                route: '/admin-reports',
                onTap: () => Get.toNamed('/admin-reports'),
              ),
              _buildDrawerItem(
                icon: Icons.exit_to_app,
                title: "ចាកចេញ",
                route: '/admin-reports',
                onTap: () => Get.toNamed('/admin-reports'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String route,
    required VoidCallback onTap,
  }) {
    return ListTile(
      selected: Get.currentRoute == route,
      selectedTileColor: Colors.white.withOpacity(0.1),
      leading: Icon(icon, color: Colors.white, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      onTap: onTap,
    );
  }

  Widget _buildExpansionItem({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      leading: Icon(icon, color: Colors.white, size: 22),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      childrenPadding: const EdgeInsets.only(left: 10),
      children: children,
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _ResDailyData {
  _ResDailyData(this.day, this.pizzaHut, this.kfc, this.lotteria);
  final String day;
  final double pizzaHut;
  final double kfc;
  final double lotteria;
}

class _ResCommissionData {
  _ResCommissionData(this.name, this.amount, this.color);
  final String name;
  final double amount;
  final Color color;
}

class _TopResDataSource extends DataGridSource {
  _TopResDataSource() {
    _rows = [
      DataGridRow(
        cells: [
          const DataGridCell<String>(
            columnName: 'name',
            value: 'Pizza Hut Monivong',
          ),
          const DataGridCell<int>(columnName: 'orders', value: 450),
          const DataGridCell<String>(
            columnName: 'revenue',
            value: '\$2,450.00',
          ),
          const DataGridCell<String>(
            columnName: 'commission',
            value: '\$245.00',
          ),
        ],
      ),
      DataGridRow(
        cells: [
          const DataGridCell<String>(
            columnName: 'name',
            value: 'KFC Riverside',
          ),
          const DataGridCell<int>(columnName: 'orders', value: 380),
          const DataGridCell<String>(
            columnName: 'revenue',
            value: '\$1,980.50',
          ),
          const DataGridCell<String>(
            columnName: 'commission',
            value: '\$198.05',
          ),
        ],
      ),
      DataGridRow(
        cells: [
          const DataGridCell<String>(
            columnName: 'name',
            value: 'Lotteria Aeon 1',
          ),
          const DataGridCell<int>(columnName: 'orders', value: 320),
          const DataGridCell<String>(
            columnName: 'revenue',
            value: '\$1,620.00',
          ),
          const DataGridCell<String>(
            columnName: 'commission',
            value: '\$162.00',
          ),
        ],
      ),
    ];
  }

  List<DataGridRow> _rows = [];
  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: (e.columnName == 'revenue' || e.columnName == 'commission')
              ? Alignment.centerRight
              : (e.columnName == 'orders'
                    ? Alignment.center
                    : Alignment.centerLeft),
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(), style: const TextStyle(fontSize: 13)),
        );
      }).toList(),
    );
  }
}

class _RecentInvoiceDataSource extends DataGridSource {
  _RecentInvoiceDataSource() {
    _rows = [
      DataGridRow(
        cells: [
          const DataGridCell<String>(columnName: 'id', value: 'INV-8821'),
          const DataGridCell<String>(
            columnName: 'customer',
            value: 'Chhorm Reach',
          ),
          const DataGridCell<String>(columnName: 'amount', value: '\$25.00'),
        ],
      ),
      DataGridRow(
        cells: [
          const DataGridCell<String>(columnName: 'id', value: 'INV-8822'),
          const DataGridCell<String>(columnName: 'customer', value: 'Sok Mesa'),
          const DataGridCell<String>(columnName: 'amount', value: '\$18.50'),
        ],
      ),
      DataGridRow(
        cells: [
          const DataGridCell<String>(columnName: 'id', value: 'INV-8823'),
          const DataGridCell<String>(
            columnName: 'customer',
            value: 'Lim Serey',
          ),
          const DataGridCell<String>(columnName: 'amount', value: '\$42.00'),
        ],
      ),
    ];
  }

  List<DataGridRow> _rows = [];
  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: e.columnName == 'amount'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString(), style: const TextStyle(fontSize: 13)),
        );
      }).toList(),
    );
  }
}
