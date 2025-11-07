import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeCards extends StatefulWidget {
  Icon icon;
  String title;
  String subTitle;
  Color color1;
  Color color2;
  int height;
  int width;
  var onTap;

  HomeCards(
      {super.key,
      required this.color1,
      required this.color2,
      required this.height,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.width,
      required this.onTap});

  @override
  State<HomeCards> createState() {
    return _HomeCardsState();
  }
}

class _HomeCardsState extends State<HomeCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width.w,
        height: widget.height.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: const Color.fromARGB(132, 255, 255, 255), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(colors: [
            widget.color1,
            widget.color2,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.icon,
                CircularPercentIndicator(
                  center: Text(
                    '95%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  animation: true,
                  animationDuration: 1200,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.95,
                  backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                  progressColor: const Color.fromARGB(255, 255, 255, 255),
                  radius: 23.sp,
                  lineWidth: 3,
                ),
              ],
            ),
            Spacer(),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
