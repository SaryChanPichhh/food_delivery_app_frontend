import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/data/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantData restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    String discountText = '';
    if (restaurant.value != null && restaurant.value! > 0) {
      if (restaurant.discountType == 'PERCENTAGE') {
        discountText = 'Up to ${restaurant.value!.toInt()}% off';
      } else {
        discountText = 'Flat \$${restaurant.value} off';
      }
    }

    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Image Area
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: restaurant.imageUrl != null && restaurant.imageUrl!.isNotEmpty
                      ? Image.network(
                          'http://10.0.2.2:8080${restaurant.imageUrl}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey[200], child: const Icon(Icons.image, size: 50, color: Colors.grey)),
                        )
                      : Container(color: Colors.grey[200], child: const Icon(Icons.image, size: 50, color: Colors.grey)),
                ),
              ),
              // Heart Icon
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    restaurant.isFav == 1 ? Icons.favorite : Icons.favorite_border,
                    color: restaurant.isFav == 1 ? Colors.pink : Colors.grey,
                    size: 18,
                  ),
                ),
              ),
              // PRO badge overlay at the bottom of the image
              if (discountText.isNotEmpty)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.stars, color: Colors.purple, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          'PRO $discountText',
                          style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          
          // Bottom Content Area
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        restaurant.resName ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${restaurant.rating ?? 0.0}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                
                // Meta Info
                Text(
                  '${restaurant.estimateTime ?? 20} min · \$\$ · ${restaurant.basedCountry ?? "Cambodia"}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                
                // Delivery fee mock
                Row(
                  children: [
                    Icon(Icons.moped, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '\$1.50 Delivery',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Tags
                if (discountText.isNotEmpty || restaurant.code != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (discountText.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.local_offer, size: 12, color: Colors.pink[400]),
                                const SizedBox(width: 4),
                                Text(
                                  discountText,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (restaurant.code != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.pink[50],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.confirmation_num, size: 12, color: Colors.pink[400]),
                                const SizedBox(width: 4),
                                Text(
                                  'Code: ${restaurant.code}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
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
