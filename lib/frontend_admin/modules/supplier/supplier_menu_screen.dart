import 'package:flutter/material.dart';

class SupplierMenuScreen extends StatelessWidget {
  SupplierMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Use a Builder to get a context below the Scaffold
        leading: Builder(
          builder: (BuildContext builderContext) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Use the new 'builderContext' to find the Scaffold and open the drawer
                Scaffold.of(builderContext).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text('Menu'), // It's good practice to have a title
      ),
      drawer: Drawer(
        // width: MediaQuery.of(context).size.width / 2,
        child: ListView(
          children: [
            ListTile(
              // tileColor: Colors.red,
              leading: Icon(Icons.add_business_outlined),
              hoverColor: Colors.red,
              minTileHeight: 0,
              title: Text('គ្រប់គ្រងស្តុក'),
            ),
            ListTile(
              // tileColor: Colors.blue,
              hoverColor: Colors.red,
              minTileHeight: 0,
              title: Text('គ្រប់គ្រងស្តុក'),
            ),
            // Divider(thickness: 2),
            ExpansionTile(
              minTileHeight: 0,
              title: Text('គ្រប់គ្រងស្តុក'),
              children: [
                ListTile(
                  // tileColor: Colors.red,
                  leading: Icon(Icons.add_business_outlined),
                  hoverColor: Colors.red,
                  minTileHeight: 0,
                  title: Text('គ្រប់គ្រងស្តុក'),
                ),
                ListTile(
                  // tileColor: Colors.blue,
                  hoverColor: Colors.red,
                  minTileHeight: 0,
                  title: Text('គ្រប់គ្រងស្តុក'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
