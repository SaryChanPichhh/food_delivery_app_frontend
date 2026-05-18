import 'package:flutter/material.dart';

class IconComponent extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  const IconComponent({super.key, required this.icon, required this.onpress});
  @override
  Widget build(BuildContext context) {
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
      child: GestureDetector(onTap: onpress, child: Icon(icon, size: 25)),
    );
  }
}
