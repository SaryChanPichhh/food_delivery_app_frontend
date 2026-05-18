import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:help_app_frontend/frontend_admin/core/app_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/delivery.jpg",
      "title": "អាហារដែលអ្នកចូលចិត្ត",
      "description":
          "ទទួលបានអាហារដែលអ្នកស្រលាញ់ទាំងអស់នៅកន្លែងតែមួយ បើអ្នកបញ្ជា យើងនឹងធ្វើអ្វីដែលនៅសល់ឱ្យអ្នក។",
    },
    {
      "image": "assets/images/delivery.jpg",
      "title": "បញ្ជាអាហារពីភោជនីយដ្ឋានដែលអ្នកជ្រើសរើស",
      "description":
          "ទទួលបានអាហារដែលអ្នកស្រលាញ់ទាំងអស់នៅកន្លែងតែមួយ បើអ្នកបញ្ជា យើងនឹងធ្វើអ្វីដែលនៅសល់ឱ្យអ្នក។",
    },
    {
      "image": "assets/images/delivery.jpg",
      "title": "សេវាដឹកជញ្ជូនដោយឥតគិតថ្លៃ",
      "description":
          "ទទួលបានអាហារដែលអ្នកស្រលាញ់ទាំងអស់នៅកន្លែងតែមួយ បើអ្នកបញ្ជា យើងនឹងធ្វើអ្វីដែលនៅសល់ឱ្យអ្នក។",
    },
  ];
  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    final data = onboardingData[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(data["image"]!, height: 250),
                        const SizedBox(height: 40),
                        Text(
                          data["title"]!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          data["description"]!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Dots indicator
              SmoothPageIndicator(
                controller:
                    _pageController, // same controller you use in PageView
                count: onboardingData.length, // number of pages
                effect: WormEffect(
                  activeDotColor: Colors.orange,
                  dotColor: Colors.orange.shade100,
                  dotHeight: 8,
                  dotWidth: 8,
                  // expansionFactor: 3,
                  spacing: 6,
                ),
              ),
              const SizedBox(height: 40),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _nextPage,
                  child: Text(
                    _currentIndex == onboardingData.length - 1
                        ? "ចាប់ផ្តើម"
                        : "បន្តាប់",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Skip text
              GestureDetector(
                onTap: () {
                  Get.offNamed(AppRoutes.signup);
                  print('${AppRoutes.signup}');
                },
                child: const Text(
                  "រំលង",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
