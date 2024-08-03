import 'package:flutter/material.dart';
import 'package:skin_care_app/features/app_info/view.dart';

class DeveloperModel {
  String? developerName;
  String? developerRole;
  String? developerEmail;
  String? developerImage;

  DeveloperModel({
    required this.developerName,
    required this.developerRole,
    required this.developerImage,
    required this.developerEmail,
  });
}

class AppDevelopersView extends StatefulWidget {
  const AppDevelopersView({super.key});

  @override
  State<AppDevelopersView> createState() => _AppDevelopersViewState();
}

class _AppDevelopersViewState extends State<AppDevelopersView> {
  List<DeveloperModel> developers = [
    DeveloperModel(
      developerName: "Olivia",
      developerRole: 'UI/UX Designer',
      developerImage: 'https://img.freepik.com/premium-photo/young-woman-working-as-telephone-operator-company-sweet-smiling_125236-11.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid',
      developerEmail: 'olivia@gmail.com',
    ),
    DeveloperModel(
      developerName: "Lucas",
      developerRole: 'Backend Developer',
      developerImage: 'https://img.freepik.com/free-photo/portrait-smiling-man-snow_23-2150771139.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid',
      developerEmail: 'lucas@gmail.com',
    ),
    DeveloperModel(
      developerName: "Sophia",
      developerRole: 'Flutter Developer',
      developerImage: 'https://img.freepik.com/premium-photo/person-sitting-front-laptop-computer-working-browsing_1254878-31919.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid',
      developerEmail: 'sophia@gmail.com',
    ),
    DeveloperModel(
      developerName: "Ethan",
      developerRole: 'Data Science Engineer',
      developerImage: 'https://img.freepik.com/free-photo/portrait-handsome-man_23-2150770971.jpg?ga=GA1.1.1921798909.1657083776&semt=ais_hybrid',
      developerEmail: 'ethan@gmail.com',
    ),
  ];

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
                        MaterialPageRoute(
                          builder: (context) => const AppInformationView(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
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
                    "App Developers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      buildProductItem(developer: developers[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: developers.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProductItem({required DeveloperModel developer}) {
  return Container(
    height: 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.network(
              developer.developerImage!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          developer.developerName!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          developer.developerRole!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          developer.developerEmail!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
