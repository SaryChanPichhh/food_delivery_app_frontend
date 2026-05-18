import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:help_app_frontend/frontend_admin/widgets/icon_component.dart';
import 'package:help_app_frontend/utils/constraint.dart';

class ItemDetailComponent extends StatefulWidget {
  final String image;
  final double price;
  final String itemDesc;
  final String description;
  final List<Map<String, double>>? relatedItem;

  const ItemDetailComponent({
    super.key,
    required this.image,
    required this.price,
    required this.itemDesc,
    required this.description,
    this.relatedItem,
  });

  @override
  State<ItemDetailComponent> createState() => _ItemDetailComponentState();
}

class _ItemDetailComponentState extends State<ItemDetailComponent> {
  bool? _outOfStock = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: Colors.transparent,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 1,
        ),
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 220,
              backgroundColor: Colors.white,
              elevation: 1,
              automaticallyImplyLeading: false,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final expandedHeight = 220.0;
                  final toolbarHeight = kToolbarHeight;
                  final progress =
                      ((expandedHeight - constraints.maxHeight) /
                              (expandedHeight - toolbarHeight))
                          .clamp(0.0, 1.0);

                  final fadeStart = 0.85;
                  final fadeEnd = 1.0;

                  final visible =
                      ((progress - fadeStart) / (fadeEnd - fadeStart)).clamp(
                        0.0,
                        1.0,
                      );

                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      // 🖼️ background image
                      Opacity(
                        opacity: 1 - progress,
                        child: Image.asset(widget.image, fit: BoxFit.cover),
                      ),

                      // ✅ always clickable back button
                      Positioned(
                        top:
                            MediaQuery.of(context).padding.top +
                            20, // 👈 avoids notch
                        left: 10,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              FontAwesomeIcons.xmark,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      // 🧾 white sticky bar (shows when scrolled)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height:
                              kToolbarHeight +
                              MediaQuery.of(context).padding.top,
                          color: Colors.white.withOpacity(visible),
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 19,
                            right: 16,
                          ),
                          alignment: Alignment.centerLeft,
                          child: Opacity(
                            opacity: visible,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('invoked');
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    FontAwesomeIcons.xmark,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'ប្តូរតម្រូវទៅតាមអតិថិជន',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🩶 Top handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🖼️ Image
                  const SizedBox(height: 20),

                  // 🧾 Item Info
                  Text(
                    widget.itemDesc,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 23),

                  // 🛒 Frequently bought section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'ទំនិញត្រូវបានទិញជាមួយគ្នាញឹកញាប់',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'អតិថិជនផ្សេងទៀតក៏បានកុម្ម៉ង់របស់ទាំងនេះផងដែរ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'ជម្រើស',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 📋 Related Items
                  if (widget.relatedItem != null &&
                      widget.relatedItem!.isNotEmpty)
                    Column(
                      children: widget.relatedItem!.map((item) {
                        final name = item.keys.first;
                        final value = item.values.first;
                        return Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(name),
                            const Spacer(),
                            Text('\$${value.toStringAsFixed(2)}'),
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                print(value);
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),

                  const SizedBox(height: 20),

                  // 🧾 Notes
                  const Text(
                    'ការណែនាំពិសេស',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'សូមអោយពួកយើងដឹងថាអ្នកមានប្រតិកម្មជាមួយអ្វីក៏ដោយ ឬ អោយពួកយើងចៀសវាងកំដាក់អ្វីដែលអ្នកមានប្រតិកម្ម',
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    maxLines: 5,
                    maxLength: 500,
                    decoration: InputDecoration(
                      hintText: 'ឧ.មិនយកទឹកកក',
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
                          color: Color.fromARGB(255, 203, 203, 203),
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 213, 210, 210),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 🧩 Out of Stock Section
                  const Text(
                    'ប្រសិនបើមិនមានផលិតផលនេះ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        builder: (BuildContext context) {
                          bool? localOutOfStock = _outOfStock;

                          return StatefulBuilder(
                            builder: (context, setModalState) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                  bottom: MediaQuery.of(
                                    context,
                                  ).viewInsets.bottom,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'ប្រសិនបើមិនមានផលិតផលនេះ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      Row(
                                        children: [
                                          Radio<bool>(
                                            value: true,
                                            groupValue: localOutOfStock,
                                            onChanged: (value) {
                                              setModalState(() {
                                                localOutOfStock = value;
                                              });
                                            },
                                          ),
                                          const Text('ទូរសព្ទមកខ្ញុំ'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Radio<bool>(
                                            value: false,
                                            groupValue: localOutOfStock,
                                            onChanged: (value) {
                                              setModalState(() {
                                                localOutOfStock = value;
                                              });
                                            },
                                          ),
                                          const Text(
                                            'ដកចេញពីការកុម្ម៉ង់របស់ខ្ញុំ',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: primaryColor,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 14,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _outOfStock = localOutOfStock;
                                                });
                                                // Navigator.pop(context);
                                              },
                                              child: const Text('ដាក់ប្រើ'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _outOfStock == true
                                ? 'ទូរសព្ទមកខ្ញុំ'
                                : 'ដកចេញពីការកុម្ម៉ង់របស់ខ្ញុំ',
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 23,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconComponent(icon: Icons.remove, onpress: () {}),
                      SizedBox(width: 15),
                      Text('1000', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 15),
                      IconComponent(icon: Icons.add, onpress: () {}),
                      SizedBox(width: 20),
                      Expanded(
                        // flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'ដាក់់ការកុម្ម៉ង់',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showItemDetailModal(
  BuildContext context, {
  required String image,
  required double price,
  required String itemDesc,
  required String description,
  List<Map<String, double>>? relatedItem,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ItemDetailComponent(
      image: image,
      price: price,
      itemDesc: itemDesc,
      description: description,
      relatedItem: relatedItem,
    ),
  );
}
