import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/core/shared/shared_appbar.dart';
import 'package:tracker/features/home/view/widgets/home_cards.dart';
import 'package:tracker/features/home/view/widgets/milestone_card.dart';
import 'package:tracker/features/home/view/widgets/progress_card.dart';
import 'package:tracker/features/home/view/widgets/todo_card.dart';

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
// ------------------------------ Cycle --------------------------------

                      HomeCards(
                          color1: Color.fromARGB(193, 178, 64, 47),
                          color2: Color.fromARGB(255, 57, 26, 26),
                          height: 150,
                          icon: Icon(
                            Icons.sync,
                            size: 30.sp,
                            color: Colors.white,
                          ),
                          subTitle: "subTitle",
                          title: 'Cycle',
                          width: 130,
                          onTap: () {}),

// ------------------------------ Expenses --------------------------------

                      HomeCards(
                        color1: Color.fromARGB(133, 22, 103, 73),
                        color2: Color.fromARGB(255, 58, 48, 39),
                        height: 150,
                        icon: Icon(
                          Icons.wallet,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                        subTitle: '\$1,250.00',
                        title: 'Total Expenses',
                        width: 220,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.expenses);
                        },
                      ),
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
                        children: [
// ------------------------------ Diet --------------------------------

                          HomeCards(
                            color1: Color.fromARGB(157, 168, 106, 7),
                            color2: Color.fromARGB(255, 81, 51, 7),
                            height: 160,
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                            subTitle: '1,200 kcal',
                            title: 'Diet Progress',
                            width: 150,
                            onTap: () {},
                          ),

// ------------------------------ Training --------------------------------

                          HomeCards(
                            color1: Color.fromARGB(141, 139, 17, 163),
                            color2: Color.fromARGB(255, 52, 22, 57),
                            height: 180,
                            icon: Icon(
                              Icons.fitness_center,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                            subTitle: '5 Exercises',
                            title: 'Training',
                            width: 150,
                            onTap: () {},
                          ),
                        ],
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
