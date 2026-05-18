import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class ExchangeCrudEntry extends StatefulWidget {
  const ExchangeCrudEntry({super.key});

  @override
  State<ExchangeCrudEntry> createState() => _ExchangeCrudEntryState();
}

class _ExchangeCrudEntryState extends State<ExchangeCrudEntry> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final _rateController = TextEditingController();
  final _symbolController = TextEditingController();
  final _defaultRateController = TextEditingController();

  bool _isDefault = false;

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _rateController.dispose();
    _symbolController.dispose();
    _defaultRateController.dispose();
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
          'កំណត់អត្រាការប្រាក់',
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
              _buildSectionTitle('ព័ត៌មានរូបិយប័ណ្ណ'),
              _buildTextField('កូដរូបិយប័ណ្ណ (ឧទាហរណ៍៖ KHR)៖', 'USD, KHR, THB...', _codeController),
              _buildTextField('ឈ្មោះរូបិយប័ណ្ណ៖', 'Cambodian Riel...', _nameController),
              _buildTextField('និមិត្តសញ្ញា (Symbol)៖', '\$, ៛, ฿...', _symbolController),

              const SizedBox(height: 20),
              _buildSectionTitle('ការកំណត់អត្រាប្តូរប្រាក់ (ធៀបនឹង 1 USD)'),
              _buildTextField('អត្រាប្តូរប្រាក់បច្ចុប្បន្ន៖', '4100', _rateController, keyboardType: TextInputType.number),
              _buildTextField('អត្រាប្តូរប្រាក់គោល (Default Rate)៖', '4000', _defaultRateController, keyboardType: TextInputType.number),

              const SizedBox(height: 20),
              _buildSectionTitle('ការកំណត់ផ្សេងៗ'),
              Row(
                children: [
                  const Text(
                    'កំណត់ជាលំនាំដើម (Default)៖',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Switch(
                    value: _isDefault,
                    activeColor: primaryColor,
                    onChanged: (value) => setState(() => _isDefault = value),
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
