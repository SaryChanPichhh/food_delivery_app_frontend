import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/widgets/primary_button_component.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/constraint.dart';

import '../../../widgets/popular_product_component.dart';
import '../../../widgets/step_indicator_component.dart';

class CartDetailScreen extends StatefulWidget {
  CartDetailScreen({super.key});

  @override
  State<CartDetailScreen> createState() => _CartDetailScreenState();
}

class _CartDetailScreenState extends State<CartDetailScreen> {
  String? selectedValue = 'A';
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final shopName = args['shopName'] ?? "ស៊ីតិក";
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(FontAwesomeIcons.xmark),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'កន្ត្រកទំនិញ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  shopName,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            StepIndicator(currentStep: 2),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ពេលវេលាដឹកជញ្ជូន', style: TextStyle()),
                          SizedBox(height: 5),
                          Text(
                            'ស្តង់ដារ (5-20 នាទី)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  ),
                                ),
                                context: context,
                                isScrollControlled: false, // default = false
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          // 👈 this makes height dynamic
                                          children: [
                                            RadioListTile<String>(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ដឹកជញ្ជួន',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'ពេលវេលាដឹកជញ្ជួន ស្តង់ដារ (5-20 នាទី)',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              value: 'A',
                                              groupValue: selectedValue,
                                              onChanged: (value) {
                                                setModalState(() {
                                                  selectedValue = value;
                                                });
                                              },
                                            ),
                                            RadioListTile<String>(
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ទៅយកផ្ទាល់',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'ពេលវេលាទៅយកការកុម្ម៉ុង ស្តង់ដារ (5 នាទី)',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              value: 'B',
                                              groupValue: selectedValue,
                                              onChanged: (value) {
                                                setModalState(() {
                                                  selectedValue = value;
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: PrimaryButtonComponent(
                                                elevation: 0,
                                                onPressed: () {},
                                                text: 'កែសម្រួល',
                                                backgroundColor: primaryColor,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Text('ផ្លាស់ប្តូរ', style: TextStyle()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsGeometry.all(15),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 10),
                  GestureDetector(
                    key: Key("1"),
                    child: Text(
                      'បន្ថែមទំនិញ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            PopularProductComponent(),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsetsGeometry.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'សរុប',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ 10.10',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ស្ដង់ដារការដឹកជញ្ជូន',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'តម្លៃថង់ប្លាស្ទិច',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '\$ 0.12',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'តម្លៃសេវាកម្ម',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(FontAwesomeIcons.circleQuestion, size: 20),
                        ],
                      ),
                      Text(
                        '\$ 0.03',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'តម្លៃអាករ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        '\$ 0.12',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.discount);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.discount_outlined),
                        SizedBox(width: 10),
                        Text(
                          'ប្រើប្រាស់ប័ណ្ណចំណាយ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
                bottom: 20,
              ),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.no_food, size: 20),
                          SizedBox(width: 10),
                          Text(
                            'សមនិងស្លាបព្រា',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      FlutterSwitch(
                        // toggleBorder: BoxBorder.all(),
                        activeColor: primaryColor,
                        borderRadius: 10,
                        width: 60,
                        value: _selected,
                        onToggle: (value) {
                          setState(() {
                            _selected = value;
                          });
                        },
                      ),
                    ],
                  ),

                  if (_selected) ...[
                    SizedBox(height: 10),
                    Text(
                      'ភោជនីយដ្ឋាននឹងផ្តល់សមនិងស្លាបព្រាជ័រអោយ ប្រសិនជាមាន',
                      style: TextStyle(fontSize: 13),
                    ),
                  ] else ...[
                    SizedBox(height: 10),
                    Text(
                      'យើងមិនភ្ជាប់សមនិងស្លាបព្រាជ័រទេ។ អរគុណកាត់បន្ថយសំរាមផ្លាស្ទិច។',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade400, blurRadius: 20),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'សរុប (បូកទាំងថ្លៃសេវា និងពន្ធ)',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$10.10',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$10.10',
                                  style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'មើលការសង្ខេប',
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: PrimaryButtonComponent(
                            text: 'ពិនិត្យការទូទាត់និងអាស័យដ្ឋានឡើងវិញ',
                            backgroundColor: primaryColor,
                            onPressed: () {},
                            elevation: 0,
                            fontSize: 16,
                            radius: 8,
                            padding: EdgeInsetsGeometry.only(
                              top: 15,
                              bottom: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container _container({
  required String text,
  required Color textColor,
  required Color backgroundColor,
}) {
  return Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
      color: backgroundColor,
      shape: BoxShape.circle, // makes it circular
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 13,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
