import 'package:flutter/material.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back_ios_new),
                      SizedBox(width: 15),
                      Text(
                        'ព័ត៏មានផ្ទាល់ខ្លួន',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/images/google.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          child: Image.asset('assets/images/google.png'),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'សារី ចន្ទពេជ្រ',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '088 867 0524',
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_outlined,
                                  color: primaryColor,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'គណនីបានផ្ទៀងផ្ទាត់',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              child: Row(
                children: [
                  Text(
                    'ព័ត៏មានផ្ទាល់ខ្លួន',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'នាមត្រកូល',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 30),
                          Text('សារី', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'នាមខ្លួន',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: 30),
                          Text('ចន្ទពេជ្រ', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'លេខទូស័រព្ទ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 30),
                          Text('0888640524', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'ភេទ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.female),
                          SizedBox(width: 30),
                          Text('ប្រុស', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'ថ្ងៃខែឆ្នាំកំណើត',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.credit_card),
                          SizedBox(width: 30),
                          Text('18/05/2025', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'ថ្ងៃផុតកំណត់',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.credit_card),
                          SizedBox(width: 30),
                          Text('18/05/2025', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'អាស័យដ្ខាន',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_location_sharp),
                          SizedBox(width: 30),
                          Text('ភ្នំពេញ', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'លេខអត្តសញ្ញាណប័ណ្ណ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add_card),
                          SizedBox(width: 30),
                          Text('585458545', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Text(
                        'អត្តសញ្ញាណប័ណ្ណ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 250,
                        child: Image.asset('assets/images/IdentityCard.jpg'),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
