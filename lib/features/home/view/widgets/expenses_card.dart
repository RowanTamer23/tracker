import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tracker/main.dart';

class ExpensesCard extends StatefulWidget {
  const ExpensesCard({super.key});

  @override
  _ExpensesCardState createState() => _ExpensesCardState();
}

class _ExpensesCardState extends State<ExpensesCard> {
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
          Color.fromARGB(133, 22, 103, 73),
          Color.fromARGB(255, 58, 48, 39)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      padding: const EdgeInsets.all(14.0),
      width: 220.w,
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.wallet,
                color: Colors.white,
                size: 30.sp,
              ),
              CircularPercentIndicator(
                center: Text(
                  '75%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animation: true,
                animationDuration: 1200,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.75,
                backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                progressColor: const Color.fromARGB(255, 255, 255, 255),
                radius: 23,
                lineWidth: 3,
              ),
            ],
          ),
          Spacer(),
          Text(
            'Total Expenses',
            style: TextStyle(
              color: isLightMode
                  ? const Color.fromARGB(255, 0, 0, 0)
                  : Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$1,250.00',
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
