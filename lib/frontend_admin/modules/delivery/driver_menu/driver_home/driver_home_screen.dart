import 'package:flutter/material.dart';
import 'package:help_app_frontend/utils/enums/order_status.dart';

import '../../../../widgets/receive_item_component.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ទទួលការកុម្ម៉ង់')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReceiveItemComponent(
              shopName: 'ស៊ិតិក',
              customerName: 'សា',
              itemDesc: 'ធីឡាយ',
              quantiy: '1',
              status: OrderStatus.pending,
            ),
          ],
        ),
      ),
    );
  }
}
