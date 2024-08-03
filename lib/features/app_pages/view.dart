import 'package:flutter/material.dart';
import 'package:skin_care_app/features/app_pages/profile/view.dart';
import 'categories/view.dart';
import 'home/view.dart';

class AppPagesView extends StatefulWidget {
  const AppPagesView({super.key});

  @override
  State<AppPagesView> createState() => _AppPagesState();
}

class _AppPagesState extends State<AppPagesView> {
  int bottomNavBarIndex = 0;
  List pages = [
    const HomeView(),
    const ProfileView(),
    const CategoriesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Luxe Beauty",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: pages[bottomNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        currentIndex: bottomNavBarIndex,
        onTap: (index) {
          setState(() {
            bottomNavBarIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.table_rows,
            ),
            label: "Categories",
          ),
        ],
      ),
    );
  }
}
