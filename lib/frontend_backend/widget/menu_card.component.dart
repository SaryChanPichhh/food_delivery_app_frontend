import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/dto/respone/menu.res.dto.dart';
import 'package:help_app_frontend/frontend_backend/widget/message_box.dart';

class MenuCartComponent extends StatelessWidget {
  final MenuResponeDto menu;

  MenuCartComponent({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // LEFT IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade200,
                child: (menu.image != null && menu.image!.isNotEmpty)
                    ? Image.network(menu.image!, fit: BoxFit.cover)
                    : const Icon(Icons.fastfood, size: 40),
              ),
            ),

            const SizedBox(width: 12),

            // RIGHT CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAME
                  Row(
                    children: [
                      Text('ឈ្មោះ​ ៖ ', style: const TextStyle(fontSize: 15)),
                      Text(
                        menu.name ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // DESCRIPTION
                  Row(
                    children: [
                      Text('បរិយាយ​ ៖ ', style: const TextStyle(fontSize: 15)),
                      Text(
                        menu.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text('ហាង​ ៖ ', style: const TextStyle(fontSize: 15)),

                      Text(
                        menu.resName ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),

                  // DESCRIPTION
                  Row(
                    children: [
                      Text('ប្រភេទ ៖ ', style: const TextStyle(fontSize: 15)),

                      Text(
                        menu.cateName ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // PRICE + ACTION
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'តម្លៃ ៖ ',
                            style: const TextStyle(fontSize: 15),
                          ),

                          Text(
                            "\$${menu.price ?? '0'}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.adminMenuCrud);
                            },
                            child: Icon(Icons.edit, color: Colors.grey),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              showConfirmDialog(
                                context: context,
                                title: "Confirm Action",
                                message: "Do you want to delete this item?",
                                onConfirm: () {
                                  print("Deleted");
                                },
                              );
                            },
                            child: Icon(Icons.delete, color: Colors.red),
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
    );
  }
}
