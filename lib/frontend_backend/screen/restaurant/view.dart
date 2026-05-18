import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:help_app_frontend/frontend_backend/data/model/restaurant_model.dart';
import 'package:help_app_frontend/frontend_backend/utils/constraint.dart';
import 'package:help_app_frontend/frontend_backend/widget/res_card.component.dart';

class RestaurantView extends StatelessWidget {
  RestaurantView({super.key});

  final List<RestaurantModel> restaurants = <RestaurantModel>[
    RestaurantModel(
      resId: 1,
      resName: "Khmer Food Restaurant",
      imageUrl: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
      latLng: "11.5564,104.9282",
      openTime: DateTime(2026, 5, 13, 7, 0),
      closeTime: DateTime(2026, 5, 13, 22, 0),
      isOpen: true,
      description: "Traditional Khmer foods and drinks.",
      estimateTime: "20-30 mins",
      basedCountry: "Cambodia",
      address: "Phnom Penh, Cambodia",
    ),

    RestaurantModel(
      resId: 2,
      resName: "Pizza Company",
      imageUrl: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
      latLng: "11.5620,104.9300",
      openTime: DateTime(2026, 5, 13, 9, 0),
      closeTime: DateTime(2026, 5, 13, 23, 0),
      isOpen: true,
      description: "Italian pizza with cheese and seafood.",
      estimateTime: "30-40 mins",
      basedCountry: "Italy",
      address: "BKK1, Phnom Penh",
    ),

    RestaurantModel(
      resId: 3,
      resName: "Burger King",
      imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
      latLng: "11.5700,104.9250",
      openTime: DateTime(2026, 5, 13, 8, 30),
      closeTime: DateTime(2026, 5, 13, 21, 30),
      isOpen: false,
      description: "Best burgers and french fries.",
      estimateTime: "15-25 mins",
      basedCountry: "USA",
      address: "Tuol Kork, Phnom Penh",
    ),

    RestaurantModel(
      resId: 4,
      resName: "Sushi Japan",
      imageUrl: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
      latLng: "11.5730,104.9340",
      openTime: DateTime(2026, 5, 13, 10, 0),
      closeTime: DateTime(2026, 5, 13, 22, 30),
      isOpen: true,
      description: "Fresh sushi and Japanese foods.",
      estimateTime: "25-35 mins",
      basedCountry: "Japan",
      address: "Sen Sok, Phnom Penh",
    ),

    RestaurantModel(
      resId: 5,
      resName: "Thai Spicy",
      imageUrl: "https://images.unsplash.com/photo-1559847844-5315695dadae",
      latLng: "11.5500,104.9200",
      openTime: DateTime(2026, 5, 13, 8, 0),
      closeTime: DateTime(2026, 5, 13, 20, 0),
      isOpen: true,
      description: "Hot and spicy Thai cuisine.",
      estimateTime: "20-30 mins",
      basedCountry: "Thailand",
      address: "Olympic Area, Phnom Penh",
    ),

    RestaurantModel(
      resId: 6,
      resName: "Coffee Cafe",
      imageUrl: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085",
      latLng: "11.5650,104.9290",
      openTime: DateTime(2026, 5, 13, 6, 0),
      closeTime: DateTime(2026, 5, 13, 18, 0),
      isOpen: true,
      description: "Coffee, bakery, and breakfast.",
      estimateTime: "10-15 mins",
      basedCountry: "France",
      address: "Riverside, Phnom Penh",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          'ភោជនីយដ្ឋាន',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.adminResCrud);
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            RestaurantCardComponent(restaurant: restaurants[index]),
        itemCount: restaurants.length,
      ),
    );
  }
}
