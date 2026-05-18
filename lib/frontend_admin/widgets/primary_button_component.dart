import 'package:flutter/material.dart';

class PrimaryButtonComponent extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double? fontSize;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final double? elevation;
  final IconData? icon;
  final Color? iconColor;

  const PrimaryButtonComponent({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.borderColor,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.radius = 8.0,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
    this.elevation,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: elevation,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? textColor, size: 20),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
