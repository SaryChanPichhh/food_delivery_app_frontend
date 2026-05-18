import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/data/model/staff_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class StaffDetailView extends StatelessWidget {
  const StaffDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final StaffModel staff = Get.arguments as StaffModel;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'ព័ត៌មានបុគ្កលិក',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(staff),
            const SizedBox(height: 16),
            _buildInfoSection(
              'ព័ត៌មានការងារ',
              [
                _buildInfoTile('លេខសម្គាល់', staff.staffId, Icons.badge),
                _buildInfoTile('មុខតំណែង', staff.position, Icons.work),
                _buildInfoTile('ដេប៉ាតឺម៉ង់', staff.department, Icons.business),
                _buildInfoTile('ថ្ងៃចូលធ្វើការ', staff.joinDate, Icons.calendar_today),
              ],
            ),
            _buildInfoSection(
              'ព័ត៌មានទំនាក់ទំនង',
              [
                _buildInfoTile('អ៊ីមែល', staff.email, Icons.email),
                _buildInfoTile('លេខទូរស័ព្ទ', staff.phone, Icons.phone),
                _buildInfoTile('ឈ្មោះអ្នកប្រើប្រាស់', staff.userName, Icons.person_pin),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(StaffModel staff) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showFullImage(staff.imageUrl),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 47,
                backgroundImage: NetworkImage(staff.imageUrl),
                onBackgroundImageError: (_, __) =>
                    const Icon(Icons.person, size: 50),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '${staff.firstName} ${staff.lastName}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: staff.isActive
                  ? Colors.greenAccent.withOpacity(0.2)
                  : Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: staff.isActive ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            child: Text(
              staff.isActive ? 'សកម្ម' : 'អសកម្ម',
              style: TextStyle(
                color: staff.isActive ? Colors.greenAccent : Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFullImage(String imageUrl) {
    if (imageUrl.isEmpty) return;
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: InteractiveViewer(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
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
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[400]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
                Text(
                  value.isNotEmpty ? value : 'មិនមាន',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
