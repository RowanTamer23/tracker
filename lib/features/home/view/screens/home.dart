import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:tracker/features/home/view/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 58, 48, 39),
            radius: 23,
            child: Icon(
              Icons.person,
              size: 40,
              color: Color(
                0xFFBF9D81,
              ),
            ),
          ),
        ),
        title: Text(
          'Hello, Rowan!',
          style: TextStyle(
            color: const Color.fromARGB(255, 58, 48, 39),
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.whatshot),
            label: Text('Streak'),
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 58, 48, 39),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 58, 48, 39),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: const Color.fromARGB(71, 255, 193, 7),
            ),
            width: double.infinity,
            height: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.auto_graph),
                    Text(
                      '  Today\'s progress',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('work done'),
                        Text('training done'),
                        Row(
                          children: [
                            TextButton.icon(
                              label: Text(
                                selectedDate == null
                                    ? DateFormat("dd MMM")
                                        .format(DateTime.now())
                                    : DateFormat("dd MMM")
                                        .format(selectedDate!),
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
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
                    CircularPercentIndicator(
                      radius: 50,
                      center: Text(
                        '60%',
                        style: TextStyle(fontSize: 25),
                      ),
                      lineWidth: 10,
                      percent: 0.6,
                      backgroundColor: Colors.black,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      startAngle: 230,
                      progressColor: Colors.black,
                      arcType: ArcType.values[1],
                      arcBackgroundColor: Color.fromARGB(133, 58, 48, 39),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationwid(),
    );
  }
}
