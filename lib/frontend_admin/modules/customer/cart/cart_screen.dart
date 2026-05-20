import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/utils/constraint.dart';

import 'package:help_app_frontend/frontend_admin/modules/home/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final cartController = Get.put(CartController());
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
      body: Obx(() {
        if (cartController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (cartController.carts.isEmpty) {
          return const Center(child: Text("មិនមានទិន្នន័យ"));
        }
        return ListView.builder(
          itemCount: cartController.carts.length,
          itemBuilder: (context, index) {
            final cart = cartController.carts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row: Image, Info, Menu icon
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Restaurant Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.grey[200],
                            child:
                                cart.resImage != null &&
                                    cart.resImage!.isNotEmpty
                                ? Image.network(
                                    'http://10.0.2.2:8080${cart.resImage}',
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.store,
                                              color: Colors.grey,
                                            ),
                                  )
                                : const Icon(Icons.store, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Restaurant Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.resName ?? 'Unknown',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '${cart.avgEstimateTime ?? "20"} mins',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.moped,
                                    size: 14,
                                    color: Colors.pink,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Free',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Trailing dots
                        const Icon(Icons.more_horiz, color: Colors.black54),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Items Row (Images and + button)
                    if (cart.items != null && cart.items!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...cart.items!.map((item) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.grey[200],
                                    child:
                                        item.menuImage != null &&
                                            item.menuImage!.isNotEmpty
                                        ? Image.network(
                                            'http://10.0.2.2:8080/${item.menuImage}',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    const Icon(
                                                      Icons.fastfood,
                                                      color: Colors.grey,
                                                    ),
                                          )
                                        : const Icon(
                                            Icons.fastfood,
                                            color: Colors.grey,
                                          ),
                                  ),
                                ),
                              );
                            }).toList(),
                            // Plus button
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                              child: const Center(
                                child: Icon(Icons.add, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 15),

                    // Footer Row (Savings and Totals)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Savings tag
                        if (cart.totalDiscount != null &&
                            cart.totalDiscount! > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.local_offer,
                                  size: 12,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Saving \$${cart.totalDiscount!.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox.shrink(),

                        // Totals
                        Row(
                          children: [
                            if (cart.totalDiscount != null &&
                                cart.totalDiscount! > 0 &&
                                cart.subTotal != null)
                              Text(
                                '\$${cart.subTotal!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            if (cart.totalDiscount != null &&
                                cart.totalDiscount! > 0)
                              const SizedBox(width: 4),
                            Text(
                              '\$${(cart.totalAfterDiscount ?? cart.subTotal ?? 0).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // View Cart Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Get.toNamed(
                          AppRoutes.cartDetail,
                          arguments: {'shopName': cart.resName ?? ''},
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Colors.black87),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'View your cart',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
