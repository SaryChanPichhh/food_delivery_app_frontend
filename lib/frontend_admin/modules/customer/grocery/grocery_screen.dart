import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({super.key});

  final List<Map<String, dynamic>> foodShops = [
    {
      'id': 1,
      'name': 'សុវណ្ណភូមិ ភោជនីយដ្ឋាន',
      'image': 'assets/images/google.png',
    },
    {'id': 2, 'name': 'បាយសៀងហួរ ឆ្ងាញ់ៗ', 'image': 'assets/images/google.png'},
    {
      'id': 3,
      'name': 'ហាងប៊ឺហ្គឺ Fresh Bite',
      'image': 'assets/images/google.png',
    },
    {
      'id': 4,
      'name': 'Pizza House Express',
      'image': 'assets/images/google.png',
    },
    {
      'id': 5,
      'name': 'Phnom Penh Coffee & Bakery',
      'image': 'assets/images/google.png',
    },
  ];
  final List<Map<String, dynamic>> categories = [
    {
      'id': 1,
      'name': 'ភិហ្សា', // Breakfast
      'image': 'assets/images/google.png',
    },
    {
      'id': 2,
      'name': 'បឺហ្គឺរ', // Lunch
      'image': 'assets/images/google.png',
    },
    {
      'id': 3,
      'name': 'ប្រភេទមី', // Dinner
      'image': 'assets/images/google.png',
    },
    {
      'id': 4,
      'name': 'អារហារកូរ៉េ', // Drinks
      'image': 'assets/images/google.png',
    },
    {
      'id': 5,
      'name': 'កាហ្វេ', // Coffee
      'image': 'assets/images/google.png',
    },
    {
      'id': 6,
      'name': 'នំ & ប៊ឺហ្គឺ', // Snacks & Burgers
      'image': 'assets/images/google.png',
    },
    {
      'id': 7,
      'name': 'អារហារ​ អ៊ីតាលី', // Italian & French Food
      'image': 'assets/images/google.png',
    },
    {
      'id': 8,
      'name': 'ស៊ុប & ប៊ូហ្វេ', // Soup & Buffet
      'image': 'assets/images/google.png',
    },
  ];
  List<Map<String, dynamic>> shotTypes = [
    {'id': "1", 'name': "ទាំងអស់"},
    {'id': "2", 'name': "គ្រឿងទេស"},
    {'id': "3", 'name': "ទំនិញទូទៅ"},
    {'id': "4", 'name': "ភេសជ្ជៈ និងស្រា"},
    {'id': "5", 'name': "ថ្នាំនិងឪសថ"},
    {'id': "6", 'name': "ផលិតផលសម្រស់"},
    {'id': "7", 'name': "គ្រឿងទេសអេឡិចត្រូនិច"},
    {'id': "8", 'name': "បន្លែនិងផ្លែឈើ"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 🟣 Scrollable header (location row + favorite icon)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Location tapped');
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '89DEo Street 118',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Phnom Penh',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 Sticky Search Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickySearchBarDelegate(),
            ),

            // ⚪ Scrollable content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    // height: 1600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // 🔹 semi-transparent black
                                blurRadius: 10, // 🔹 how soft the shadow looks
                                offset: const Offset(
                                  0,
                                  5,
                                ), // 🔹 x=0, y=4 → bottom shadow
                              ),
                            ],
                          ),
                          height: 120,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: foodShops.length,
                            itemBuilder: (context, index) {
                              final shop = foodShops[index];
                              return Container(
                                width: 110,
                                height: 100,
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(shop['image']),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      shop['name'],
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ហាងល្បីៗ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(
                                  0.1,
                                ), // 🔹 semi-transparent black
                                blurRadius: 10, // 🔹 how soft the shadow looks
                                offset: const Offset(
                                  0,
                                  5,
                                ), // 🔹 x=0, y=4 → bottom shadow
                              ),
                            ],
                          ),
                          height: 120,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return Container(
                                width: 110,
                                height: 100,
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Image.asset(category['image']),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      category['name'],
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ទិញទំនិញតាមហាង',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: shotTypes.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final shotType = shotTypes[index];

                                return GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        final shotTypeName = shotType['name'];
                                        return Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Container(
                                                  width: 50,
                                                  height: 4,
                                                  margin: const EdgeInsets.only(
                                                    bottom: 12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          2,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'ប្រភេទ៖ $shotTypeName',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              const Text(
                                                'នេះជារូបមន្តនិងព័ត៌មានបន្ថែមសម្រាប់ប្រភេទនេះ។',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                    context,
                                                  ); // close bottom sheet
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                ),
                                                child: const Text('បិទ'),
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: primaryColor,
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        if (shotType['icon'] != null) ...[
                                          Icon(
                                            shotType['icon'],
                                            color: primaryColor,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 6),
                                        ],
                                        Text(
                                          shotType['name'],
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  // bottom: 10,
                                ),
                                // decoration: BoxDecoration(color: Colors.red),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        // 🟢 Background: your existing container
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.3,
                                                ),
                                                blurRadius: 4,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          width: 100,
                                          height: 90,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Image.asset(
                                              category['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        // 🔴 Overlay: favorite icon in the top-right corner
                                        Positioned(
                                          top: 6,
                                          right: 6,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(
                                                0.7,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            padding: const EdgeInsets.all(4),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: Colors.black,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(width: 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category['name'],
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          category['name'],
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          category['name'],
                                          style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              category['name'],
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              category['name'],
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // simulate scroll content
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🧱 Sticky search bar delegate
class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 68; // exact height of search bar
  @override
  double get maxExtent => 68;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Optional: Add shadow when scrolling down
    final showShadow = shrinkOffset > 0;

    return Container(
      height: 68,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: primaryColor,
          boxShadow: showShadow
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ]
              : [],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'ស្វែងរកភោជនីយដ្ឋាន និងហាងទំនិញ',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
