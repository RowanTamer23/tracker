import 'package:flutter/material.dart';
import 'package:tracker/core/shared/shared_appbar.dart';
import 'package:tracker/core/shared/bottom_navigation_bar.dart';
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
      appBar: SharedAppBar(),
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
