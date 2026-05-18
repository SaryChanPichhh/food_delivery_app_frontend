import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/widgets/icon_component.dart';

class PopularProductComponent extends StatelessWidget {
  PopularProductComponent({super.key});

  final items = [
    {
      'id': 1,
      "itemDesc": "អូវ៉ាន់ទីនទឹកដោះគោ",
      'price': 1.60,
      'discountPrice': 1.28,
      'itemImage': "assets/images/milktea.png",
    },
    {
      'id': 2,
      "itemDesc": "កាហ្វេឡាតេត្រជាក់",
      'price': 2.10,
      // 'discountPrice': 1.85,
      'itemImage': "assets/images/tealive_bubble.png",
    },
    {
      'id': 3,
      "itemDesc": "កាហ្វេឡាតេត្រជាក់",
      'price': 2.10,
      'discountPrice': 1.85,
      'itemImage': "assets/images/milktea.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ពេញនិយមសម្រាប់កុម៉្មង់ជាមួយគ្នា',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text('អតិថិជនផ្សេងទៀតក៏បានកុម្ម៉ង់របស់ទាំងនេះដែរ'),
          const SizedBox(height: 10),

          // Horizontal list of products
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // 👈 important
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isDiscount = item['discountPrice'] != null;
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 170,
                            // color: Colors.red,
                            child: Image.asset(item['itemImage'].toString()),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconComponent(
                              icon: Icons.add,
                              onpress: () {
                                print(item['price'].toString());
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          children: [
                            if (item['discountPrice'] != null) ...[
                              Text(
                                '\$${item['discountPrice']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                            SizedBox(width: 5),
                            Text(
                              '\$${item['price']}',
                              style: TextStyle(
                                decoration: isDiscount
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: isDiscount ? Colors.grey : Colors.black,
                                fontWeight: isDiscount
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Product info
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['itemDesc'].toString(),
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
