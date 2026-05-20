import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/data/models/discount_menu_model.dart';

class MenuWithResInfoComponent extends StatelessWidget {
  final DiscountMenuData menuData;

  const MenuWithResInfoComponent({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    final double originalPrice = menuData.price ?? 0.0;
    final String discountType = menuData.discountType ?? '';
    final double discountValue = menuData.discountValue ?? 0.0;

    double discountedPrice = originalPrice;
    String discountText = '';

    if (discountType == 'PERCENTAGE') {
      discountedPrice = originalPrice - (originalPrice * discountValue / 100);
      discountText = '${discountValue.toInt()}% off';
    } else if (discountType == 'FIXED_AMOUNT') {
      discountedPrice = originalPrice - discountValue;
      discountText = '\$${discountValue.toStringAsFixed(2)} off';
    }

    // Ensure price doesn't go below 0
    if (discountedPrice < 0) discountedPrice = 0;

    return Container(
      width: 170, // Slightly wider to fit content comfortably
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with delivery time pill
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  // For testing, since actual images might be local or on a server,
                  // we'll try to load network if it's a full URL, or use a placeholder
                  // The data says "images/dishes/..." so we'll just show a placeholder if it fails
                  'http://10.0.2.2:8000/${menuData.image ?? ''}',
                  height: 120,
                  width: 170,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      width: 170,
                      color: Colors.grey[200],
                      child: const Icon(Icons.fastfood, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '5-20 mins',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Restaurant Info
          Row(
            children: [
              const CircleAvatar(
                radius: 9,
                backgroundImage:
                    AssetImage('assets/images/google.png'), // placeholder
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  menuData.resName ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.star, color: Colors.orange, size: 14),
              Text(
                ' ${menuData.rating ?? ''}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Menu Name
          Text(
            menuData.name ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Prices
          Row(
            children: [
              Text(
                '\$${discountedPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD81B60), // Pink color like in image
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '\$${originalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),

          // Discount Text
          if (discountText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                discountText,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFFD81B60),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const SizedBox(height: 4),

          // Delivery Fee
          Row(
            children: const [
              Icon(Icons.directions_bike, size: 14, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                'Free',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
