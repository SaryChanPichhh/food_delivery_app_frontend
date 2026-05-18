import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/exchange_rate.model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/exchange_card.component.dart';

class ExchangeView extends StatefulWidget {
  const ExchangeView({super.key});

  @override
  State<ExchangeView> createState() => _ExchangeViewState();
}

class _ExchangeViewState extends State<ExchangeView> {
  // Dummy data for exchange rates
  final List<ExchangeRateModel> exchangeRates = [
    ExchangeRateModel(
      id: 1,
      currencyCode: 'KHR',
      currencyName: 'Cambodian Riel',
      isDefault: true,
      rate: 4100.0,
      symbol: '៛',
      updatedAt: '2024-05-13 10:00',
      defaultRate: 4000.0,
    ),
    ExchangeRateModel(
      id: 2,
      currencyCode: 'THB',
      currencyName: 'Thai Baht',
      isDefault: false,
      rate: 36.5,
      symbol: '฿',
      updatedAt: '2024-05-13 10:00',
      defaultRate: 35.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'គ្រប់គ្រងអត្រាការប្រាក់',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          _buildAddButton(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: exchangeRates.length,
              itemBuilder: (context, index) {
                return ExchangeCardComponent(exchangeRate: exchangeRates[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'បញ្ជីអត្រាប្តូរប្រាក់',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.adminExchangeCrud),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.add, color: Colors.white, size: 20),
                  SizedBox(width: 4),
                  Text(
                    'បន្ថែមថ្មី',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
