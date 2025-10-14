import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Color.fromARGB(200, 58, 48, 39),
          child: Icon(
            Icons.person,
            size: 70.r,
            color: Color(0xFFBF9D81),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name Surname',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              'name.surname@gmail.com',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(200, 58, 48, 39),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
