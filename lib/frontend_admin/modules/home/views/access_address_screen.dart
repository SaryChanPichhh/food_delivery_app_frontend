import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class AccessAddressScreen extends StatelessWidget {
  const AccessAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/images/delivery.jpg'),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Get.offNamed(AppRoutes.menuBar);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Access Location',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 35,
                      width: 35,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'SETEC DELIVERY APP នឹងប្រើទីតាំងរបស់អ្នកតែពេលអ្នកកំពុងប្រើប្រាស់កម្មវិធីប៉ុណ្ណោះ។',
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
