import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/main.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: isLightMode
              ? KColorScheme.secondary
              : KColorSchemeDark.secondaryContainer,
          radius: 40.r,
          child: Icon(Icons.person,
              size: 70.r,
              color: isLightMode
                  ? KColorScheme.primaryFixed
                  : KColorSchemeDark.surfaceDim),
        ),
        SizedBox(width: 20.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rowan Tamer',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                // color: Colors.black,
              ),
            ),
            Text(
              'Rowan.tamer23@gmail.com',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: isLightMode
                    ? KColorScheme.onSurface
                    : KColorSchemeDark.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
