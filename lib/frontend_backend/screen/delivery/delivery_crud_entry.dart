import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';

class DeliveryCrudEntry extends StatefulWidget {
  const DeliveryCrudEntry({super.key});

  @override
  State<DeliveryCrudEntry> createState() => _DeliveryCrudEntryState();
}

class _DeliveryCrudEntryState extends State<DeliveryCrudEntry> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _licenseController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _userIdController = TextEditingController();

  bool _status = true;

  // Image Picking
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;
  XFile? _licenseImage;
  XFile? _nationalIdImage;

  Future<void> _pickImage(String type) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (type == 'profile') {
          _profileImage = image;
        } else if (type == 'license') {
          _licenseImage = image;
        } else if (type == 'nationalId') {
          _nationalIdImage = image;
        }
      });
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _licenseController.dispose();
    _nationalIdController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _userIdController.dispose();
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
          'ចុះឈ្មោះអ្នកដឹកជញ្ជូន',
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
              _buildSectionTitle('ព័ត៌មានផ្ទាល់ខ្លួន'),
              _buildImagePicker('រូបភាពផ្ទាល់ខ្លួន', _profileImage, 'profile'),
              _buildTextField('លេខទូរស័ព្ទ៖', '012 345 678', _phoneController),
              _buildTextField('អ៊ីមែល៖', 'example@gmail.com', _emailController),
              _buildTextField(
                'លេខសម្គាល់អ្នកប្រើប្រាស់៖',
                'user_123',
                _userIdController,
              ),

              SizedBox(height: 20),
              _buildSectionTitle('ព័ត៌មានអត្តសញ្ញាណ'),
              _buildTextField('លេខប័ណ្ណបើកបរ៖', 'DL-XXXXX', _licenseController),
              _buildImagePicker('រូបភាពប័ណ្ណបើកបរ', _licenseImage, 'license'),
              _buildTextField(
                'លេខអត្តសញ្ញាណប័ណ្ណ៖',
                'NID-XXXXX',
                _nationalIdController,
              ),
              _buildImagePicker(
                'រូបភាពអត្តសញ្ញាណប័ណ្ណ',
                _nationalIdImage,
                'nationalId',
              ),

              SizedBox(height: 20),
              _buildSectionTitle('អាសយដ្ឋាន'),
              _buildTextField('អាសយដ្ឋាន៖', 'ផ្ទះលេខ...', _addressController),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'ទីក្រុង៖',
                      'ភ្នំពេញ',
                      _cityController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      'ខេត្ត/រដ្ឋ៖',
                      'ភ្នំពេញ',
                      _stateController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'លេខកូដតំបន់៖',
                      '12000',
                      _zipController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _buildTextField(
                      'ប្រទេស៖',
                      'កម្ពុជា',
                      _countryController,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              _buildSectionTitle('ស្ថានភាព'),
              Row(
                children: [
                  const Text(
                    'ស្ថានភាពហាង៖',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  Switch(
                    value: _status,
                    activeColor: primaryColor,
                    onChanged: (value) => setState(() => _status = value),
                  ),
                  Text(
                    _status ? 'សកម្ម' : 'អសកម្ម',
                    style: TextStyle(
                      color: _status ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              _buildActionButtons(),
              SizedBox(height: 20),
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

  Widget _buildImagePicker(String label, XFile? image, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () => _pickImage(type),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(File(image.path), fit: BoxFit.cover),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.grey[400],
                          size: 40,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ជ្រើសរើសរូបភាព',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
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
          SizedBox(height: 4),
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
              // Save logic
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
