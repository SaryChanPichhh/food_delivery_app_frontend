import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class CouponAssignCrudEntry extends StatefulWidget {
  const CouponAssignCrudEntry({super.key});

  @override
  State<CouponAssignCrudEntry> createState() => _CouponAssignCrudEntryState();
}

class _CouponAssignCrudEntryState extends State<CouponAssignCrudEntry> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _couponIdController = TextEditingController();
  final _notesController = TextEditingController();

  String _assignmentType = 'Restaurant';
  String _status = 'Active';

  // Selection Data
  String? _selectedRestaurantId;
  String? _selectedMenuId;

  final List<Map<String, String>> _mockRestaurants = [
    {'id': '101', 'name': 'Pizza Hut (Monivong)'},
    {'id': '102', 'name': 'KFC (Riverside)'},
    {'id': '103', 'name': 'Lotteria (Aeon 1)'},
  ];

  final List<Map<String, String>> _mockMenus = [
    {'id': '501', 'name': 'Pepperoni Pizza'},
    {'id': '502', 'name': 'Zinger Burger'},
    {'id': '503', 'name': 'Coca Cola 1.5L'},
    {'id': '504', 'name': 'Cheese Fries'},
  ];

  @override
  void dispose() {
    _couponIdController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'ផ្ដល់ប័ណ្ណបញ្ចុះតម្លៃ',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('ការកំណត់គោលដៅ'),
              _buildDropdownField(
                'ប្រភេទការផ្ដល់ជូន៖',
                ['Restaurant', 'Menu Item'],
                _assignmentType,
                (val) {
                  setState(() {
                    _assignmentType = val!;
                    _selectedRestaurantId = null;
                    _selectedMenuId = null;
                  });
                },
              ),
              _buildTextField(
                'លេខសម្គាល់គូប៉ុង (Coupon ID)៖',
                'ឧទាហរណ៍៖ 1',
                _couponIdController,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),
              if (_assignmentType == 'Restaurant')
                _buildSearchableDropdown(
                  'ជ្រើសរើសភោជនីយដ្ឋាន៖',
                  _mockRestaurants,
                  _selectedRestaurantId,
                  (val) => setState(() => _selectedRestaurantId = val),
                ),

              if (_assignmentType == 'Menu Item')
                _buildSearchableDropdown(
                  'ជ្រើសរើសមុខម្ហូប៖',
                  _mockMenus,
                  _selectedMenuId,
                  (val) => setState(() => _selectedMenuId = val),
                ),

              const SizedBox(height: 20),
              _buildSectionTitle('ព័ត៌មានបន្ថែម'),
              _buildTextField(
                'សម្គាល់/ចំណាំ៖',
                'បញ្ចូលព័ត៌មានបន្ថែម...',
                _notesController,
                maxLines: 3,
              ),
              _buildDropdownField(
                'ស្ថានភាព៖',
                ['Active', 'Inactive'],
                _status,
                (val) => setState(() => _status = val!),
              ),

              const SizedBox(height: 40),
              _buildActionButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchableDropdown(
    String label,
    List<Map<String, String>> items,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                hint: Text(
                  'សូមជ្រើសរើស...',
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item['id'],
                        child: Text('${item['name']} (ID: ${item['id']})'),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> items,
    String value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                items: items
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'បោះបង់',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'រក្សាទុក',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
