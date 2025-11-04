import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/profile/widgets/dropdown_menu.dart';
import 'package:tracker/features/profile/widgets/profile_view.dart';
import 'package:tracker/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 100).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Profile Header
          ProfileView(),

          SizedBox(height: 40.h),
          // Profile Options
          ListTile(
            leading: Icon(
              Icons.edit,
            ),
            title: Text('Edit Profile'),
            onTap: () {
              // Navigate to Edit Profile Screen
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
          Divider(
            color: Color.fromARGB(200, 58, 48, 39),
            thickness: 1,
          ),
          ListTile(title: ThemeDropdown()),
          Divider(
            color: Color.fromARGB(200, 58, 48, 39),
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.person_add,
            ),
            title: Text('Invite a Friend'),
            onTap: () {
              // Navigate to Invite a Friend Screen
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
          Divider(
            color: Color.fromARGB(200, 58, 48, 39),
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.help,
            ),
            title: Text('Help'),
            onTap: () {
              // Navigate to Help Screen
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
          Divider(
            color: Color.fromARGB(200, 58, 48, 39),
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/login',
              );
              // Handle Logout
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
        ],
      ),
    ));
  }
}
