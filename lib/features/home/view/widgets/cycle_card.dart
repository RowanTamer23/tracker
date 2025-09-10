import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CycleCard extends StatefulWidget {
  const CycleCard({super.key});

  @override
  State<CycleCard> createState() => _CycleCardState();
}

class _CycleCardState extends State<CycleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(193, 178, 64, 47),
          Color.fromARGB(255, 57, 26, 26)
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
              Icon(
                Icons.sync,
                color: Colors.white,
                size: 30,
              ),
              CircularPercentIndicator(
                center: Text(
                  '95%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animation: true,
                animationDuration: 1200,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.95,
                backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                progressColor: const Color.fromARGB(255, 255, 255, 255),
                radius: 23,
                lineWidth: 3,
              ),
            ],
          ),
          Spacer(),
          Text(
            'Cycle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '5 days left',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
