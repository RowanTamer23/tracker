import 'package:flutter/material.dart';
import 'package:tracker/features/home/view/widgets/bottom_navigation_bar.dart';
import 'package:tracker/features/home/view/widgets/cycle_card.dart';
import 'package:tracker/features/home/view/widgets/diet_card.dart';
import 'package:tracker/features/home/view/widgets/expenses_card.dart';
import 'package:tracker/features/home/view/widgets/milestone_card.dart';
import 'package:tracker/features/home/view/widgets/progress_card.dart';
import 'package:tracker/features/home/view/widgets/todo_card.dart';
import 'package:tracker/features/home/view/widgets/training_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(200, 58, 48, 39),
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
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              foregroundColor: WidgetStateProperty.all(
                const Color.fromARGB(255, 58, 48, 39),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                foregroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 58, 48, 39),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MilestoneCard(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(children: [
                  ProgressCard(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CycleCard(),
                      ExpensesCard(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TodoCard(),
                      Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [DietCard(), TrainingCard()],
                      )
                    ],
                  )
                ])),
          )
        ]),
      ),
    );
  }
}
