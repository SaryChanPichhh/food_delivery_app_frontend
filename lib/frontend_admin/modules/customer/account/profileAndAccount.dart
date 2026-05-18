import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAndAccountScreen extends StatelessWidget {
  ProfileAndAccountScreen({super.key});
  final title = Get.arguments as String? ?? 'Profile & Account';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        title: Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 100, height: 100, child: CircleAvatar()),
                      SizedBox(height: 10),
                      Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        "",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ឈ្មោះ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ថ្ងៃកំណើត",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "លេខទូរសព្ទ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ភេទ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ទីកន្លែងកំណើត",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Divider(),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "ផ្ទះលេខ ៧៨, ផ្លូវលេខ ១១, ភូមិព្រៃស្រង់, ឃុំសំបួរ, ស្រុកកំពង់ស្ពឺ, ខេត្តកំពង់ចាម",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(thickness: 1),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "អាស័យដ្ខានបច្ចុប្បន្ន",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Divider(),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "ផ្ទះលេខ ៧៨, ផ្លូវលេខ ១១, ភូមិព្រៃស្រង់, ឃុំសំបួរ, ស្រុកកំពង់ស្ពឺ, ខេត្តកំពង់ចាម",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
