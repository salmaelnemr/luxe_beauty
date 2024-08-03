import 'package:flutter/material.dart';
import 'package:skin_care_app/features/app_developers/view.dart';
import 'package:skin_care_app/features/app_pages/view.dart';

class AppInformationView extends StatefulWidget {
  const AppInformationView({super.key});

  @override
  State<AppInformationView> createState() => _AppInformationViewState();
}

class _AppInformationViewState extends State<AppInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/top-view-soap-with-lavender-beside_23-2148295895.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppPagesView(),),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 24,
                      color: Colors.brown,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AppDevelopersView(),),
                      );
                    },
                    child: const Icon(
                      Icons.developer_board,
                      size: 24,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LUXE BEAUTY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Our cosmetics application is your go-to destination for the finest beauty products at competitive prices. Featuring a sleek and user-friendly design, the app allows you to browse a wide range of products, from makeup and skincare to fragrances and beauty tools.\n \nJoin our community now and enjoy a unique and delightful shopping experience for all your beauty needs.\n \nYou can see our developers app by click the icon at the right of this page.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
