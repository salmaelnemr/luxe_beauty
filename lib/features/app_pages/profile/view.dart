import 'package:flutter/material.dart';
import 'package:skin_care_app/models/user_model.dart';
import '../../../dio/api_provider.dart';

class ProfileModel {
  String? iconName;
  dynamic icon;

  ProfileModel({
    required this.iconName,
    required this.icon,
  });
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<ProfileModel> properties = [
    ProfileModel(iconName: "Privacy", icon: Icons.lock_outline_rounded,),
    ProfileModel(iconName: "Purchase History", icon: Icons.settings_backup_restore,),
    ProfileModel(iconName: "Help & Support", icon: Icons.help_outline_sharp,),
    ProfileModel(iconName: "Settings", icon: Icons.settings,),
    ProfileModel(iconName: "Invite a Friend", icon: Icons.person_add_rounded,),
    ProfileModel(iconName: "Logout", icon: Icons.logout,),
  ];

  UserModel? userModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    final apiProvider = ApiProvider();
    final user = await apiProvider.getUser();

    setState(() {
      userModel = user;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20,),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isLoading == true
                      ? const Center(child: CircularProgressIndicator())
                      :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 47,
                            backgroundImage: NetworkImage(
                              userModel!.image!,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              bottom: 3,
                              end: 3,
                            ),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey[300],
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  size: 16,
                                  color: Colors.brown,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userModel!.username!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        userModel!.email!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 192,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.brown[300],
                        ),
                        child: const Text(
                          "Upgrade to PRO",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => buildProfileProperties(profile: properties[index],),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 17,
                  ),
                  itemCount: properties.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProfileProperties({required ProfileModel profile}) {
  return Container(
    height: 44,
    width: 350,
    alignment: Alignment.center,
    padding: const EdgeInsets.only(right: 16, left: 16,),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.grey[200],
    ),
    child: Row(
      children: [
        const SizedBox(width: 7,),
        Icon(
          profile.icon,
          size: 20,
          color: Colors.brown,
        ),
        const SizedBox(width: 7,),
        Text(
          profile.iconName!,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.brown,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.navigate_next_sharp,
          size: 30,
          color: Colors.brown,
        ),
      ],
    ),
  );
}

