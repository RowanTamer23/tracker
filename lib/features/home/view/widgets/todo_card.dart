import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 350.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(141, 17, 127, 163),
          Color.fromARGB(255, 39, 59, 76)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 254, 254, 254),
                ),
                RepaintBoundary(
                  child: CircularPercentIndicator(
                    center: Text(
                      '50%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    animation: true,
                    animationDuration: 1200,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: 0.50,
                    backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                    progressColor: const Color.fromARGB(255, 255, 255, 255),
                    radius: 23.sp,
                    lineWidth: 3.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'To-Do',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      size: 10.sp,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Task 1',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10.sp,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Task 2',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
