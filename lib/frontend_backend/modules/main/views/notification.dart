import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class AdminNotification extends StatelessWidget {
  AdminNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: secondaryColor),
          color: secondaryColor,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: primaryColor,
        title: Text(
          'ការជូនដំណឺង',
          style: TextStyle(color: secondaryColor, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'គ្មានការជូនដំណឺង',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
