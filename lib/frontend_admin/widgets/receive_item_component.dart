import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/enums/order_status.dart';

class ReceiveItemComponent extends StatelessWidget {
  final String shopName;
  final String customerName;
  final String itemDesc;
  final String quantiy;
  final OrderStatus status;
  final LatLng? shopLatLng;
  final LatLng? customerLatLng;

  const ReceiveItemComponent({
    super.key,
    required this.shopName,
    required this.customerName,
    required this.itemDesc,
    required this.quantiy,
    required this.status,
    this.shopLatLng,
    this.customerLatLng,
  });

  Color _getStatusColor() {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orangeAccent;
      case OrderStatus.accepted:
        return Colors.blueAccent;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (status) {
      case OrderStatus.pending:
        return "Pending Pickup";
      case OrderStatus.accepted:
        return "On the Way";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.cancelled:
        return "Cancelled";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Shop + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.store, color: Colors.deepPurpleAccent),
                  const SizedBox(width: 8),
                  Text(
                    shopName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor().withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getStatusText(),
                  style: TextStyle(
                    color: _getStatusColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Item Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.fastfood_outlined, color: Colors.orangeAccent),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  itemDesc,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'x$quantiy',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Customer Info
          Row(
            children: [
              const Icon(Icons.person_pin_circle, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  customerName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Map Preview (optional)
          if (shopLatLng != null && customerLatLng != null)
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: SizedBox(
            //       height: 150,
            //       child: GoogleMap(
            //         initialCameraPosition: CameraPosition(
            //           target: shopLatLng!,
            //           zoom: 13,
            //         ),
            //         markers: {
            //           Marker(
            //             markerId: const MarkerId('shop'),
            //             position: shopLatLng!,
            //             infoWindow: const InfoWindow(title: 'Shop'),
            //           ),
            //           Marker(
            //             markerId: const MarkerId('customer'),
            //             position: customerLatLng!,
            //             infoWindow: const InfoWindow(title: 'Customer'),
            //           ),
            //         },
            //         zoomControlsEnabled: false,
            //         liteModeEnabled: true, // Better for performance
            //       ),
            //     )
            //   ),
            // ),
            const SizedBox(height: 16),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Implement navigation logic
                  },
                  icon: const Icon(Icons.navigation_outlined, size: 18),
                  label: const Text("Navigate"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(color: Colors.deepPurple),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Implement completion logic
                  },
                  icon: const Icon(Icons.check_circle_outline, size: 18),
                  label: const Text("Mark as Done"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
