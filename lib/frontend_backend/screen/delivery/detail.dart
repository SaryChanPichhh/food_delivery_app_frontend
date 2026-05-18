import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_backend/data/model/delivery_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';

class DeliveryDetailView extends StatelessWidget {
  const DeliveryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the delivery model passed from the previous screen
    final DeliveryModedl delivery = Get.arguments as DeliveryModedl;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ព័ត៌មានលម្អិត',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(delivery),
            const SizedBox(height: 16),
            _buildInfoSection('ព័ត៌មានអត្តសញ្ញាណ', [
              _buildInfoTile(
                'លេខប័ណ្ណបើកបរ',
                delivery.driverLicense,
                Icons.badge,
              ),
              _buildInfoTile(
                'លេខអត្តសញ្ញាណប័ណ្ណ',
                delivery.nationalId,
                Icons.perm_identity,
              ),
            ]),
            _buildInfoSection('ព័ត៌មានទំនាក់ទំនង', [
              _buildInfoTile('លេខទូរស័ព្ទ', delivery.phone, Icons.phone),
              _buildInfoTile('អ៊ីមែល', delivery.email, Icons.email),
              _buildInfoTile(
                'លេខសម្គាល់អ្នកប្រើប្រាស់',
                delivery.userId,
                Icons.person_outline,
              ),
            ]),
            _buildInfoSection('អាសយដ្ឋាន', [
              _buildInfoTile(
                'អាសយដ្ឋាន',
                delivery.address,
                Icons.location_city,
              ),
              _buildInfoTile('ទីក្រុង', delivery.city, Icons.map),
              _buildInfoTile('ខេត្ត/រដ្ឋ', delivery.state, Icons.explore),
              _buildInfoTile('លេខកូដតំបន់', delivery.zip, Icons.pin_drop),
              _buildInfoTile('ប្រទេស', delivery.country, Icons.public),
            ]),
            const SizedBox(height: 20),
            _buildDocumentsSection(delivery),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(DeliveryModedl delivery) {
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
            onTap: () => _showFullImage(delivery.imageUrl),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 47,
                backgroundImage: NetworkImage(delivery.imageUrl),
                onBackgroundImageError: (_, __) =>
                    const Icon(Icons.person, size: 50),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'លេខសម្គាល់៖ ${delivery.delId}',
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
              color: delivery.status
                  ? Colors.greenAccent.withOpacity(0.2)
                  : Colors.redAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: delivery.status ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            child: Text(
              delivery.status ? 'សកម្ម' : 'អសកម្ម',
              style: TextStyle(
                color: delivery.status ? Colors.greenAccent : Colors.redAccent,
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

  Widget _buildDocumentsSection(DeliveryModedl delivery) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildDocCard('ប័ណ្ណបើកបរ', delivery.driverLicenseImage),
          const SizedBox(width: 16),
          _buildDocCard('អត្តសញ្ញាណប័ណ្ណ', delivery.nationalIdImage),
        ],
      ),
    );
  }

  Widget _buildDocCard(String title, String imageUrl) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _showFullImage(imageUrl),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageUrl.isNotEmpty
                    ? Image.network(imageUrl, fit: BoxFit.cover)
                    : Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey[300],
                          size: 40,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
