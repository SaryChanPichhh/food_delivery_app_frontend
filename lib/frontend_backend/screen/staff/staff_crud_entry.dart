import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:image_picker/image_picker.dart';

class StaffCrudEntry extends StatefulWidget {
  const StaffCrudEntry({super.key});

  @override
  State<StaffCrudEntry> createState() => _StaffCrudEntryState();
}

class _StaffCrudEntryState extends State<StaffCrudEntry> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _staffIdController = TextEditingController();
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _positionController = TextEditingController();
  final _departmentController = TextEditingController();
  final _joinDateController = TextEditingController();

  bool _isActive = true;

  // Image Picking
  final ImagePicker _picker = ImagePicker();
  XFile? _staffImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _staffImage = image;
      });
    }
  }

  @override
  void dispose() {
    _staffIdController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    _departmentController.dispose();
    _joinDateController.dispose();
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
          'ចុះឈ្មោះបុគ្គលិក',
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
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: _staffImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              File(_staffImage!.path),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo,
                                color: Colors.grey[400],
                                size: 30,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'រូបភាព',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle('ព័ត៌មានបុគ្គលិក'),
              _buildTextField('លេខសម្គាល់៖', 'STF001', _staffIdController),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('នាមត្រកូល៖', 'ត្រកូល', _firstNameController),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField('នាមខ្លួន៖', 'ឈ្មោះ', _lastNameController),
                  ),
                ],
              ),
              _buildTextField('ឈ្មោះអ្នកប្រើប្រាស់៖', 'username', _userNameController),
              _buildTextField('អ៊ីមែល៖', 'example@gmail.com', _emailController),
              _buildTextField('លេខទូរស័ព្ទ៖', '012 345 678', _phoneController),

              const SizedBox(height: 20),
              _buildSectionTitle('ព័ត៌មានការងារ'),
              _buildTextField('មុខតំណែង៖', 'Manager', _positionController),
              _buildTextField('ផ្នែក/ដេប៉ាតឺម៉ង់៖', 'Operations', _departmentController),
              _buildTextField('ថ្ងៃចូលធ្វើការ៖', 'YYYY-MM-DD', _joinDateController),

              const SizedBox(height: 20),
              _buildSectionTitle('ស្ថានភាព'),
              Row(
                children: [
                  const Text(
                    'គណនីសកម្ម៖',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switch(
                    value: _isActive,
                    activeColor: primaryColor,
                    onChanged: (value) => setState(() => _isActive = value),
                  ),
                  Text(
                    _isActive ? 'សកម្ម' : 'អសកម្ម',
                    style: TextStyle(
                      color: _isActive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
    TextEditingController controller,
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
          TextField(
            controller: controller,
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
