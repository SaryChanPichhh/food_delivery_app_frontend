import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/widgets/primary_button_component.dart';
import 'package:help_app_frontend/frontend_admin/widgets/text_form_component.dart';
import 'package:help_app_frontend/utils/constraint.dart';
import 'package:lottie/lottie.dart';

class DeliveryRegisterScreen extends StatelessWidget {
  DeliveryRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 15),
            Text('ចុះឈ្មោះអ្នកដឹកជញ្ជូន', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              width: double.infinity,
              height: 200,
              child: Lottie.asset(
                'assets/lottie/Delivery guy.json',
                repeat: true,
                animate: true,
              ),
            ),
            TextFormComponent(label: 'ឈ្មោះប្រើប្រាស់'),
            TextFormComponent(label: 'លេខទូស័រព្ទ'),
            // TextFormComponent(label: 'អ៊ីម៉េល'),
            TextFormComponent(label: 'លេខសម្ងាត់'),
            TextFormComponent(label: 'បញ្ជាក់លេខសម្ងាត់'),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: PrimaryButtonComponent(
                    text: 'ចុះឈ្មោះ',
                    padding: EdgeInsets.symmetric(vertical: 17),
                    backgroundColor: primaryColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
