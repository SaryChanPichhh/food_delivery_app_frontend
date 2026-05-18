import 'package:flutter/material.dart';
import 'package:help_app_frontend/frontend_admin/widgets/card_component.dart';

class FavoritesRestuarantScreen extends StatelessWidget {
  FavoritesRestuarantScreen({super.key});

  final List<CardComponent> shopList = [
    CardComponent(
      image: 'assets/images/google.png',
      shopName: 'Lucky Cafe',
      duration: '25–35 min',
      deliveryCupon: 'Free Delivery',
      discountOnItem: '10% OFF',
      deliveryOnPayment: 'Cash on Delivery',
      rating: 4.7,
      orders: 120,
    ),
    CardComponent(
      image: 'assets/images/google.png',
      shopName: 'Phnom Pizza',
      duration: '30–40 min',
      deliveryCupon: '₱1 Delivery',
      discountOnItem: '20% OFF',
      deliveryOnPayment: 'Online Payment Only',
      rating: 4.5,
      orders: 95,
    ),
    CardComponent(
      image: 'assets/images/google.png',
      shopName: 'Street Noodles',
      duration: '15–25 min',
      deliveryCupon: 'Free Delivery',
      discountOnItem: '5% OFF',
      deliveryOnPayment: 'Cash or Card',
      rating: 4.8,
      orders: 200,
    ),
    CardComponent(
      image: 'assets/images/google.png',
      shopName: 'Korean BBQ House',
      duration: '40–50 min',
      deliveryCupon: '₱2 Delivery',
      discountOnItem: '15% OFF',
      deliveryOnPayment: 'Cash on Delivery',
      rating: 4.6,
      orders: 150,
    ),
    CardComponent(
      image: 'assets/images/google.png',
      shopName: 'Sweet Time Bakery',
      duration: '20–30 min',
      deliveryCupon: 'Free Delivery',
      discountOnItem: 'Buy 1 Get 1',
      deliveryOnPayment: 'Online Payment',
      rating: 4.9,
      orders: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: shopList.length,
        itemBuilder: (context, index) {
          final shop = shopList[index];
          return CardComponent(
            image: shop.image,
            shopName: shop.shopName,
            duration: shop.duration,
            deliveryCupon: shop.deliveryCupon,
            discountOnItem: shop.discountOnItem,
            deliveryOnPayment: shop.deliveryOnPayment,
            rating: shop.rating,
            orders: shop.orders,
          );
        },
      ),
    );
  }
}
