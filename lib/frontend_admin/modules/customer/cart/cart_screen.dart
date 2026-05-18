import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/constraint.dart';

import '../../../widgets/primary_button_component.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final List<Map<String, dynamic>> carts = [
    {
      'prodId': 1,
      'shopImage': "assets/images/google.png",
      'shopName': "គ្រួសារកាហ្វេដួង (សន្ធរម៉ុក)",
      'prodImage': ["assets/images/google.png", "assets/images/google.png"],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'កន្ត្រកទំនិញទាំងអស់',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('ការដិកជញ្ចូនទៅ៖', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: carts.length,
        itemBuilder: (context, index) {
          final cart = carts[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: secondaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Container(
                            decoration: BoxDecoration(color: secondaryColor),
                            height: 40,
                            width: 40,
                            child: Image.asset(cart['shopImage']),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'គ្រួសារកាហ្វេដូង (សន្ធរម៉ុក)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'គ្រួសារកាហ្វេដូង (សន្ធរម៉ុក)',
                              style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(height: 10),

                    /// Product images (horizontal scroll)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            // color: Colors.red,
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cart['prodImage'].length,
                              itemBuilder: (context, imgIndex) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: Image.asset(
                                    cart['prodImage'][imgIndex],
                                    width: 40,
                                    height: 40,
                                    // fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        // const SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButtonComponent(
                            text: "មើលកន្រ្តកទំនិញអ្នក",
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                            borderColor: Colors.black,
                            onPressed: () => Get.toNamed(
                              AppRoutes.cartDetail,
                              arguments: {'shopName': 'កាហ្វេអេប (សន្ធរម៉ុក)'},
                            ),
                            elevation: 0,
                            fontSize: 14,
                            padding: EdgeInsetsGeometry.only(top: 5, bottom: 5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
