import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:image_picker/image_picker.dart';

class UserCrudEntry extends StatefulWidget {
  const UserCrudEntry({super.key});

  @override
  State<UserCrudEntry> createState() => _UserCrudEntryState();
}

class _UserCrudEntryState extends State<UserCrudEntry> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _userIdController = TextEditingController();
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _roleController = TextEditingController(text: 'Customer');

  bool _isActive = true;

  // Image Picking
  final ImagePicker _picker = ImagePicker();
  XFile? _userImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _userImage = image;
      });
    }
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _roleController.dispose();
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
          'ចុះឈ្មោះអតិថិជន',
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
                    child: _userImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              File(_userImage!.path),
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
              _buildSectionTitle('ព័ត៌មានគណនី'),
              _buildTextField('លេខសម្គាល់៖', 'USER001', _userIdController),
              _buildTextField('ឈ្មោះអ្នកប្រើប្រាស់៖', 'username', _userNameController),
              _buildTextField('ពាក្យសម្ងាត់៖', '********', _passwordController, isPassword: true),

              const SizedBox(height: 20),
              _buildSectionTitle('ព័ត៌មានផ្ទាល់ខ្លួន'),
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
              _buildTextField('អ៊ីមែល៖', 'example@gmail.com', _emailController),
              _buildTextField('លេខទូរស័ព្ទ៖', '012 345 678', _phoneController),
              _buildTextField('អាសយដ្ឋាន៖', 'ភ្នំពេញ...', _addressController),
              _buildTextField('តួនាទី៖', 'Customer', _roleController),

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
    TextEditingController controller, {
    bool isPassword = false,
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
            obscureText: isPassword,
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
