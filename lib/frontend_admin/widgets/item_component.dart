import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/widgets/icon_component.dart';
import 'package:help_app_frontend/frontend_admin/widgets/item_detail_component.dart';

class ItemComponent extends StatelessWidget {
  final String itemDesc;
  final double value;
  final String description;
  final String image;

  const ItemComponent({
    super.key,
    required this.itemDesc,
    required this.value,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section (Text)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemDesc,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Right Section (Image + Icon)
          Container(
            height: 130,
            width: 130,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () => showItemDetailModal(
                      context,
                      relatedItem: [
                        {"Iced Coffee": 3.50},
                        {"Milk Tea": 4.00},
                        {"Lemonade": 2.80},
                        {"Iced Latte": 5.00},
                      ],
                      price: 1,
                      itemDesc: 'តែក្រហមចាហ៊ួយកាហ្វេ',
                      description:
                          'តែក្រហមចាហ៊ួយកាហ្វេ តែក្រហមចាហ៊ួយកាហ្វេ តែក្រហមចាហ៊ួយកាហ្វេ តែក្រហមចាហ៊ួយកាហ្វេ',
                      image: 'assets/images/google.png',
                    ),
                    child: IconComponent(icon: Icons.add, onpress: () {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
