import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/profile/widgets/profile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            leading: Icon(Icons.edit, color: Color.fromARGB(200, 58, 48, 39)),
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
          ListTile(
            leading:
                Icon(Icons.dark_mode, color: Color.fromARGB(200, 58, 48, 39)),
            title: Text('Dark Mode'),
            onTap: () {
              // Navigate to Dark Mode Screen
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
          Divider(
            color: Color.fromARGB(200, 58, 48, 39),
            thickness: 1,
          ),
          ListTile(
            leading:
                Icon(Icons.person_add, color: Color.fromARGB(200, 58, 48, 39)),
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
            leading: Icon(Icons.help, color: Color.fromARGB(200, 58, 48, 39)),
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
            leading: Icon(Icons.logout, color: Color.fromARGB(200, 58, 48, 39)),
            title: Text('Logout'),
            onTap: () {
              // Handle Logout
            },
            splashColor: (Color.fromARGB(50, 58, 48, 39)),
          ),
        ],
      ),
    ));
  }
}
