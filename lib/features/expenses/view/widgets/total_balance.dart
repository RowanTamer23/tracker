import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/expenses/controller/expenses_bloc.dart';
import 'package:tracker/features/expenses/controller/expenses_state.dart';
import 'package:tracker/features/expenses/view/widgets/chart/chart.dart';
import 'package:tracker/main.dart';

class TotalBalance extends StatefulWidget {
  double balance;
  double total;
  double left;
  var onPressed;
  bool showChart;

  TotalBalance(
      {super.key,
      required this.balance,
      required this.left,
      required this.total,
      required this.onPressed,
      required this.showChart});

  @override
  State<TotalBalance> createState() {
    return _TotalBalanceState();
  }
}

class _TotalBalanceState extends State<TotalBalance> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesBloc, ExpensesState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,

            // border: Border.all(
            //     color: const Color.fromARGB(132, 255, 255, 255), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15)),

            color: Color.fromARGB(206, 29, 136, 97),
          ),
          padding: const EdgeInsets.all(14.0),
          width: double.infinity,
          height: widget.showChart ? 330.h : 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  IconButton(
                      onPressed: widget.onPressed,
                      icon: Icon(
                        Icons.stacked_bar_chart_outlined,
                        color: Colors.white60,
                      )),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.white,
                    size: 35.sp,
                  ),
                  Text(
                    widget.balance.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  if (widget.showChart) chart(expenses: state.expenses),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.left.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(widget.total.toString(),
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: LinearProgressIndicator(
                          minHeight: 20.sp,
                          backgroundColor: Colors.white30,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                          value: (100 -
                                  (widget.total - widget.left) /
                                      widget.total *
                                      100) /
                              100, // progress value
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          '${(100 - (widget.total - widget.left) / widget.total * 100)} \% of Monthly Budget Left', // dynamically computed text
                          style: TextStyle(
                            color: Colors
                                .black, // choose contrast depending on theme
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
