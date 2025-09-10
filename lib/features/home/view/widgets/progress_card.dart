import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCard extends StatefulWidget {
  const ProgressCard({super.key});

  @override
  _ProgressCardState createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(
            color: const Color.fromARGB(132, 255, 255, 255), width: 1),
        // color: const Color.fromARGB(71, 255, 193, 7),
        gradient: LinearGradient(colors: [
          Color.fromARGB(194, 195, 82, 6),
          Color.fromARGB(101, 195, 82, 6)
        ], begin: Alignment.centerRight, end: Alignment.centerLeft),
      ),
      width: double.infinity,
      height: 150,
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.auto_graph),
                Text(
                  '  Today\'s progress',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 229, 208),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Today\'s Reminder',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        TextButton.icon(
                          label: Text(
                            selectedDate == null
                                ? DateFormat("dd MMM").format(DateTime.now())
                                : DateFormat("dd MMM").format(selectedDate!),
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2024),
                              lastDate: DateTime.now(),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.expand_more,
                            size: 30,
                            color: Colors.black,
                          ),
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 10,
          top: 15,
          child: CircularPercentIndicator(
            radius: 60,
            center: Text(
              '60%',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            lineWidth: 15,
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
        ),
      ]),
    );
  }
}
