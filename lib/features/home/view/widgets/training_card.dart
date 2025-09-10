import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TrainingCard extends StatefulWidget {
  const TrainingCard({super.key});

  @override
  State<TrainingCard> createState() => _TrainingCardState();
}

class _TrainingCardState extends State<TrainingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: [
          Color.fromARGB(141, 139, 17, 163),
          Color.fromARGB(255, 52, 22, 57)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      padding: const EdgeInsets.all(16.0),
      width: 160,
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.fitness_center,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: 10),
              CircularPercentIndicator(
                center: Text(
                  '30%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                animation: true,
                animationDuration: 1200,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.30,
                backgroundColor: const Color.fromARGB(20, 255, 255, 255),
                progressColor: const Color.fromARGB(255, 255, 255, 255),
                radius: 23,
                lineWidth: 3,
              ),
            ],
          ),
          Spacer(),
          Text(
            'Training',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '5 Exercises',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
