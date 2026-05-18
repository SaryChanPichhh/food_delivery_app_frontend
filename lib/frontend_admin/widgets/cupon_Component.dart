import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class CuponComponent extends StatelessWidget {
  final String description;
  final String dicountPercent;
  final String dicountCode;
  final String expireDate;
  final double remainPrice;
  final double onDiscountPrice;
  final int limited;
  CuponComponent({
    super.key,
    required this.description,
    required this.dicountPercent,
    required this.dicountCode,
    required this.expireDate,
    required this.remainPrice,
    required this.limited,
    required this.onDiscountPrice,
  });

  @override
  Widget build(BuildContext context) {
    final remainPercent =
        MediaQuery.of(context).size.width -
        (remainPrice * MediaQuery.of(context).size.width / onDiscountPrice);
    // print();
    print(remainPercent);
    return CustomPaint(
      painter: CouponPainter(),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (remainPrice > 0) ...[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.35),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 12,
                        bottom: 12,
                      ),
                      child: Text(
                        'ថែម \$${remainPrice} ដើម្បីប្រើកូដនេះ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: remainPercent,
                      height: 3,
                      decoration: BoxDecoration(color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade600,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.local_activity,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${dicountPercent}%',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(FontAwesomeIcons.circleExclamation, size: 18),
                          SizedBox(width: 5),
                          Text(
                            dicountCode,
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(20, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 10,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.rectangle,
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(50),
                        border: BoxBorder.all(color: Colors.grey),
                      ),
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        'ការចំណាយតិចបំផុត \$${onDiscountPrice} - បានប្រើដោយ ${expireDate}',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'ដាក់ប្រើ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CouponPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..isAntiAlias = true;

    final path = Path();
    const double cornerRadius = 12;
    const double cutRadius = 10;

    // Start top-left corner
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);

    // Right cut
    path.lineTo(size.width, size.height / 2 - cutRadius);
    path.arcToPoint(
      Offset(size.width, size.height / 2 + cutRadius),
      radius: const Radius.circular(cutRadius),
      clockwise: false,
    );

    // Bottom-right corner
    path.lineTo(size.width, size.height - cornerRadius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - cornerRadius,
      size.height,
    );
    path.lineTo(cornerRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - cornerRadius);

    // Left cut
    path.lineTo(0, size.height / 2 + cutRadius);
    path.arcToPoint(
      Offset(0, size.height / 2 - cutRadius),
      radius: const Radius.circular(cutRadius),
      clockwise: false,
    );

    // Top-left corner
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    path.close();

    // Draw shape background
    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 3, true);
    canvas.drawPath(path, paint);

    // Border
    final borderPaint = Paint()
      ..color = const Color.fromARGB(255, 179, 177, 177)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
