import 'package:flutter/material.dart';

class AddressComponents {
  static void showAddressBottomModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.circle, size: 30),
                  title: Row(
                    children: [
                      Icon(Icons.flag_rounded),
                      Text('Cambodia', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  trailing: Text('ផ្លាស់ប្តូរ', style: TextStyle(fontSize: 14)),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
