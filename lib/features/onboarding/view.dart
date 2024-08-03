import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_care_app/features/login/view.dart';
import 'onboarding_page.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'imageUrl':
          "https://img.freepik.com/premium-photo/portrait-make-up-artist-woman-with-makeup-brushes-near-face-beauty-concept_81262-1599.jpg?ga=GA1.1.1921798909.1657083776",
      'title': 'Personalized Beauty Picks',
      'description':
          'Get recommendations tailored just for you. Our smart algorithm considers your unique preferences, skin type, and previous purchases to suggest the best products for your beauty routine. Discover new favorites and enjoy a shopping experience that\'s perfectly customized to your needs.',
    },
    {
      'imageUrl':
          "https://img.freepik.com/free-photo/foundation-product-branding-still-life_23-2149665134.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid",
      'title': 'EXPLORE TOP BRANDS',
      'description':
          'Dive into a world of beauty with our curated selection of top cosmetics brands. From high-end luxury to everyday favorites, discover the best products to elevate your makeup routine. Enjoy exclusive access to the latest releases and timeless classics, all in one convenient place.',
    },
    {
      'imageUrl':
          "https://img.freepik.com/free-photo/woman-using-face-roller-her-beauty-routine_23-2150166444.jpg?ga=GA1.1.1921798909.1657083776",
      'title': 'ORDER NOW',
      'description':
          'Shop your favorite beauty products with just a few clicks. Enjoy a seamless shopping experience and place your order now for quick delivery. Treat yourself to the best in cosmetics and skincare without any hassle.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = pages[index];
              return OnboardingPage(
                imageUrl: page['imageUrl']!,
                title: page['title']!,
                description: page['description']!,
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 16,
            right: 16,
            child: DotsIndicator(
              dotsCount: pages.length,
              position: currentPage.toDouble(),
              decorator: DotsDecorator(
                activeColor: Colors.brown,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  currentPage < pages.length - 1
                      ? TextButton(
                          onPressed: () {
                            pageController.jumpToPage(pages.length - 1);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  currentPage < pages.length - 1
                      ? TextButton(
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () => _onDone(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                            minimumSize: const Size(120, 50),
                          ),
                          child: const Text(
                            "Let's Go",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDone(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
