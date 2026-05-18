import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/widgets/modal_components.dart';
import 'package:help_app_frontend/frontend_admin/widgets/sticky_search_menu_component.dart';
import 'package:help_app_frontend/frontend_admin/modules/customer/favorite/favortite_screen.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class FoodScreen extends StatelessWidget {
  FoodScreen({super.key});

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
    {'id': "1", 'name': "តម្រៀប"},
    {'id': "2", 'name': "offers"},
    {'id': "3", 'name': "Ratings"},
    {'id': "4", 'name': "បង្ហាញទាំងអស់"},
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
                          GestureDetector(
                            onTap: () =>
                                AddressComponents.showAddressBottomModal(
                                  context,
                                ),
                            child: Column(
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
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(
                          () => FavortiteScreen(),
                          fullscreenDialog: true,
                          transition: Transition.topLevel,
                        );
                      },
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
              delegate: StickySearchBarDelegate(
                // searchText: 'ស្វែងរកភោជនីយដ្ឋាន និងហាងទំនិញ',
                widget: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ស្វែងរកភោជនីយដ្ឋាន និងហាងទំនិញ',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
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
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),

            // ⚪ Scrollable content
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ហាងថ្មីៗ ចុះតម្លៃរហូតដល់',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '30%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ភោជនីយដ្ឋានពេញនិយម',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: const Color.fromARGB(
                                        255,
                                        156,
                                        156,
                                        156,
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
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
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ម៉ាកល្បីៗ',
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
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
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

                        SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ស្វែងរកភោជនីយដ្ឋាន',
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
