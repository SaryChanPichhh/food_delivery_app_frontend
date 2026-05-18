import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/account/profileAndAccount.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        title: const Text(
          'គណនី',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('Settings tapped');
            },
            icon: const Icon(Icons.settings, size: 28, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => ProfileAndAccountScreen(),
                  fullscreenDialog: false, // ✅ not a full-screen replacement
                  transition: Transition.topLevel,
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Sary ChanPich',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('មើលគណនី'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 110,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,

                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'សន្សំជាមួយ pandapro! គិតថ្លៃសម្រាប់ថ្ងៃ 3O',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            // SizedBox(height: 5),
                            Text(
                              'ចាប់ផ្តើមការសាកល្បងគិតថ្លៃរបស់អ្នក',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: _container(
                      'ការកុម្ម៉ង់',
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: _container(
                      'ចូលចិត្ត',
                      Icons.favorite_border_outlined,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(child: _container('ការទូទាត់', Icons.payment)),
                  SizedBox(width: 20),
                  Expanded(
                    child: _container('អាស័យដ្ខាន', Icons.location_on_outlined),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'អត្ថប្រយោជន៏សម្រាប់អ្នក',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    _listTile(
                      'កូដបញ្ចុះតម្លៃ',
                      Icons.discount_outlined,
                      Icons.arrow_forward_ios_rounded,
                    ),
                    Divider(color: Colors.black, thickness: 0.3),
                    _listTile(
                      'ណែនាំមិត្ត',
                      Icons.card_giftcard,
                      Icons.arrow_forward_ios_rounded,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ទូទៅ',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    // SizedBox(height: 10),
                    _listTile(
                      'ជំនួយការអតិថិជន',
                      Icons.question_mark,
                      Icons.arrow_forward_ios_rounded,
                    ),
                    Divider(color: Colors.black, thickness: 0.3),
                    _listTile(
                      'សម្រាប់អាជីវកម្ម',
                      Icons.maps_home_work_outlined,
                      Icons.arrow_forward_ios_rounded,
                    ),
                    Divider(color: Colors.black, thickness: 0.3),
                    _listTile(
                      'សម្រាប់អ្នកដឹកជញ្ជូន',
                      Icons.delivery_dining,
                      Icons.arrow_forward_ios_rounded,
                      onPress: () {
                        Get.toNamed(AppRoutes.deliverRegister);
                      },
                    ),
                    Divider(color: Colors.black, thickness: 0.3),
                    _listTile(
                      'លក្ខខណ្ឌ និងគោលការណ៏',
                      Icons.list_alt,
                      Icons.arrow_forward_ios_rounded,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "ចាកចេញ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(child: Text('Version 1.0.0')), SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container _container(String text, IconData icon) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: const Color.fromARGB(255, 188, 188, 188),
        ),
      ],
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 10),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    ),
  );
}

ListTile _listTile(
  String text,
  IconData leadingIcon,
  IconData trailingIcon, {
  VoidCallback? onPress,
}) {
  return ListTile(
    onTap: onPress,
    leading: Icon(leadingIcon),
    contentPadding: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
    minTileHeight: 50,
    title: Text(text),
    trailing: Icon(trailingIcon, size: 20),
  );
}
