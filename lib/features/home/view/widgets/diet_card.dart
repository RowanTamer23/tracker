import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tracker/main.dart';

class DietCard extends StatefulWidget {
  const DietCard({super.key});

  @override
  _DietCardState createState() => _DietCardState();
}

class _DietCardState extends State<DietCard> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(157, 168, 106, 7),
          Color.fromARGB(255, 81, 51, 7)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      padding: const EdgeInsets.all(16.0),
      width: 150.w,
      height: 160.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.white,
                size: 30.sp,
              ),
              SizedBox(width: 10),
              CircularPercentIndicator(
                center: Text(
                  '60%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animation: true,
                animationDuration: 1200,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.60,
                backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                progressColor: const Color.fromARGB(255, 255, 255, 255),
                radius: 23.sp,
                lineWidth: 3.sp,
              ),
            ],
          ),
          Spacer(),
          Text(
            'Diet Progress',
            style: TextStyle(
              color: isLightMode
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '1,200 kcal',
            style: TextStyle(
              color: isLightMode ? Colors.white : Colors.white70,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
