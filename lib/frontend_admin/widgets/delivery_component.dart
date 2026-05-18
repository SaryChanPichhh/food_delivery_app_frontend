import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryComponent extends StatefulWidget {
  final String description;
  final String subTitle;
  final String? address;
  final String? addressLink;
  const DeliveryComponent({
    super.key,
    required this.description,
    required this.subTitle,
    this.address,
    this.addressLink,
  });

  @override
  State<DeliveryComponent> createState() => _DeliveryComponentState();
}

class _DeliveryComponentState extends State<DeliveryComponent> {
  int value = 0;
  bool _isDelivery = true;
  // Future<void> _launchMaps(String address) async {
  //   final String googleUrl = '$address';
  //   if (await canLaunch(googleUrl)) {
  //     await launch(googleUrl);
  //   } else {
  //     throw 'Could not launch $googleUrl';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 111, 111, 111),
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left box
              Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: AnimatedToggleSwitch<bool>.dual(
                  current: _isDelivery,
                  first: T,
                  second: F,
                  spacing: 15.0, // smaller spacing between icons
                  borderWidth: 1.0,
                  height: 35, // reduced height
                  indicatorSize: const Size(35, 35), // smaller indicator circle
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (val) {
                    print(_isDelivery);
                    setState(() => _isDelivery = val);
                  },
                  style: ToggleStyle(
                    borderColor: Colors.transparent,
                    backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                    indicatorColor: Colors.white,
                  ),
                  iconBuilder: (local) => Icon(
                    local
                        ? FontAwesomeIcons.motorcycle
                        : FontAwesomeIcons.personWalking,
                    size: 20,
                    color: local
                        ? Colors.black
                        : const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(width: 10),

              // Right column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.subTitle,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.description,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.description,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    if (!_isDelivery) ...[
                      Divider(),
                      // SizedBox(height: 5),
                      GestureDetector(
                        onTap: () => {},
                        child: Text(
                          widget.address!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ] else ...[
                      // Handle the case where _isDelivery is null
                      // You can add any widget or logic here
                      SizedBox(height: 5),
                    ],
                  ],
                ),
              ),
              Text(
                'ផ្លាស់ប្តូរ',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
