import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/widgets/cupon_Component.dart';
import 'package:help_app_frontend/frontend_admin/widgets/primary_button_component.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class DiscountScreen extends StatelessWidget {
  DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('ប័ណ្ណចំណាយ', style: TextStyle(fontSize: 18)),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 40,
            ),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                TextFormField(
                  // autofocus: true,
                  decoration: InputDecoration(
                    // label: Text('បញ្ចូលលេខកូដប័ណ្ណចំណាយ'),
                    // filled: true,
                    // border: InputBorder.none,
                    labelText: ('បញ្ចូលលេខកូដប័ណ្ណចំណាយ'),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButtonComponent(
                        text: 'ដាក់ប្រើ',
                        backgroundColor: primaryColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 30),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ជ្រើសរើសប័ណ្ណមួយពីបញ្ជី',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: CuponComponent(
                            description:
                                'បញ្ចុំតម្លៃ70%លើការកុម្ម៉ង់ដំបូងរបស់អ្នក',
                            dicountPercent: '70',
                            dicountCode: 'WEMISSYOU',
                            limited: 3,
                            remainPrice: 0,
                            expireDate: '02 ធ្នូរ 2024 - 30 វិច្ឆការ 2025',
                            onDiscountPrice: 6,
                          ),
                        );
                      },
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
}
