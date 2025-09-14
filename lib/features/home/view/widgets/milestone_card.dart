import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MilestoneCard extends StatefulWidget {
  const MilestoneCard({super.key});

  @override
  _MilestoneCardState createState() => _MilestoneCardState();
}

class _MilestoneCardState extends State<MilestoneCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        // color: const Color.fromARGB(71, 255, 193, 7),
        gradient: RadialGradient(colors: [
          Color.fromARGB(205, 125, 233, 181),
          Color.fromARGB(121, 0, 0, 0),
        ], radius: 2.5, focal: Alignment.center, focalRadius: 0.1),
      ),
      width: double.infinity,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.leaderboard),
                  Text(
                    '  My Milestones',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 229, 208),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.touch_app_outlined,
                size: 25,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 25,
                      center: Icon(
                        Icons.military_tech,
                        size: 30,
                        color: Colors.tealAccent,
                      ),
                      lineWidth: 6,
                      percent: 0.6,
                      backgroundColor: Colors.black,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      startAngle: 230,
                      progressColor: Colors.black,
                      arcType: ArcType.values[1],
                      arcBackgroundColor: Color.fromARGB(69, 58, 48, 39),
                    ),
                    Text('todos')
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 25,
                      center: Icon(
                        Icons.military_tech,
                        size: 30,
                        color: Colors.tealAccent,
                      ),
                      lineWidth: 6,
                      percent: 0.6,
                      backgroundColor: Colors.black,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      startAngle: 230,
                      progressColor: Colors.black,
                      arcType: ArcType.values[1],
                      arcBackgroundColor: Color.fromARGB(69, 58, 48, 39),
                    ),
                    Text('todos')
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 25,
                      center: Icon(
                        Icons.military_tech,
                        size: 30,
                        color: Colors.tealAccent,
                      ),
                      lineWidth: 6,
                      percent: 0.6,
                      backgroundColor: Colors.black,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      startAngle: 230,
                      progressColor: Colors.black,
                      arcType: ArcType.values[1],
                      arcBackgroundColor: Color.fromARGB(69, 58, 48, 39),
                    ),
                    Text('todos')
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                child: Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 25,
                      center: Icon(
                        Icons.military_tech,
                        size: 30,
                        color: Colors.tealAccent,
                      ),
                      lineWidth: 6,
                      percent: 0.6,
                      backgroundColor: Colors.black,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      startAngle: 230,
                      progressColor: Colors.black,
                      arcType: ArcType.values[1],
                      arcBackgroundColor: Color.fromARGB(69, 58, 48, 39),
                    ),
                    Text('todos')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
