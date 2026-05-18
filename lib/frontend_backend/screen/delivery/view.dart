import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/delivery_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/delivery_card.component.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  static final List<DeliveryModedl> dummyDrivers = [
    DeliveryModedl(
      delId: 101,
      address: 'ផ្លូវលេខ ២៧១',
      city: 'ភ្នំពេញ',
      country: 'កម្ពុជា',
      driverLicense: 'DL-12345',
      driverLicenseImage: '',
      nationalId: 'NID-999',
      nationalIdImage: '',
      phone: '012 345 678',
      email: 'driver1@gmail.com',
      imageUrl: 'https://i.pravatar.cc/150?u=101',
      state: 'ភ្នំពេញ',
      zip: '12000',
      userId: 'user_01',
      status: true,
    ),
    DeliveryModedl(
      delId: 102,
      address: 'បុរីពិភពថ្មី',
      city: 'តាខ្មៅ',
      country: 'កម្ពុជា',
      driverLicense: 'DL-67890',
      driverLicenseImage: '',
      nationalId: 'NID-888',
      nationalIdImage: '',
      phone: '098 765 432',
      email: 'driver2@gmail.com',
      imageUrl: 'https://i.pravatar.cc/150?u=102',
      state: 'កណ្តាល',
      zip: '08000',
      userId: 'user_02',
      status: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: const Text(
          'អ្នកដឹកជញ្ជូន',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.adminDeliveryCrud),
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: dummyDrivers.length,
        itemBuilder: (context, index) {
          return DeliveryCardComponent(delivery: dummyDrivers[index]);
        },
      ),
    );
  }
}
