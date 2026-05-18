import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/widgets/delivery_component.dart';
import 'package:help_app_frontend/frontend_admin/widgets/item_component.dart';
import 'package:help_app_frontend/frontend_admin/widgets/sticky_search_menu_component.dart';

class ItemDetailScreen extends StatelessWidget {
  ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Positioned(
                        top: 6,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _container(Icons.arrow_back),
                            Row(
                              children: [
                                _container(Icons.question_mark_outlined),
                                SizedBox(width: 10),
                                _container(Icons.favorite_border_outlined),
                                SizedBox(width: 10),
                                _container(Icons.share),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'បាប់ (អាយអេហ្វអិល)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    child: DeliveryComponent(
                      description: 'ដឹកជញ្ជូន 35-65នាទី',
                      subTitle: 'ថ្លៃដឹកជញ្ជូន ',
                      address:
                          "No. 86A, Street 110, Russian Federation Blvd (110), Phnom Penh",
                      addressLink: "https://maps.app.goo.gl/kdwqdmq4KzXx3e1s6",
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Expanded(child: CuponComponent()),
                        // SizedBox(width: 10),
                        // Expanded(child: CuponComponent()),
                      ],
                    ),
                  ),

                  // Trending Menu
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickySearchBarDelegate(
                widget: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ស្វែងរកទំនិញក្នុងមុីនុយ',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFE0E0E0),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    ItemComponent(
                      description:
                          "តែមេអំបៅក្រូចឆ្មាទឹកឃ្មុំ តែមេអំបៅក្រូចឆ្មាទឹកឃ្មុំ តែមេអំបៅក្រូចឆ្មាទឹកឃ្មុំ តែមេអំបៅក្រូចឆ្មាទឹកឃ្មុំ",
                      image: "assets/images/google.png",
                      itemDesc: "តែមេអំបៅក្រូចឆ្មាទឹកឃ្មុំ ",
                      value: 10,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 1000)),
          ],
        ),
      ),
    );
  }
}

Container _container(IconData icon) {
  return Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(60),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 2,
          spreadRadius: 0.5,
        ),
      ],
    ),
    child: Icon(icon, size: 25),
  );
}
