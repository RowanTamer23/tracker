import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/expenses/controller/expenses_bloc.dart';
import 'package:tracker/features/expenses/controller/expenses_event.dart';
import 'package:tracker/features/expenses/controller/expenses_state.dart';
import 'package:tracker/features/expenses/view/screens/new_expense.dart';
import 'package:tracker/features/expenses/view/widgets/chart/chart.dart';
import 'package:tracker/features/expenses/view/widgets/expenses_list/expenses_list.dart';
import 'package:tracker/features/expenses/view/widgets/saving.dart';
import 'package:tracker/features/expenses/view/widgets/total_balance.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  bool showChart = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => ExpensesBloc()..add(LoadExpenses()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(189, 16, 79, 56),
          title: const Text('Expenses'),
        ),
        body: BlocBuilder<ExpensesBloc, ExpensesState>(
          builder: (context, state) {
            Widget mainContent = const Center(
              child: Text('No Expenses Added Yet!'),
            );

            if (state.expenses.isNotEmpty) {
              mainContent = ExpenseList(
                expenses: state.expenses,
                onRemoved: (expense) {
                  context.read<ExpensesBloc>().add(RemoveExpense(expense));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Expense Deleted'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          context.read<ExpensesBloc>().add(AddExpense(expense));
                        },
                      ),
                    ),
                  );
                },
              );
            }

            if (width <= 600) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TotalBalance(
                      showChart: showChart,
                      balance: 5000,
                      total: 1000,
                      left: 300,
                      onPressed: () {
                        setState(() {
                          showChart = !showChart;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Savings',
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Add Savings',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black45
                                  : Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Saving(
                            title: 'Home',
                            total: 100,
                            saved: 10,
                          ),
                          Saving(
                            title: 'Phone',
                            total: 500,
                            saved: 20,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _openAddExpenseOverlay(context);
                            });
                          },
                          child: Text(
                            'Add Expense',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black45
                                  : Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: mainContent),
                  ],
                ),
              );
            } else {
              return Row(
                children: [
                  Expanded(child: chart(expenses: state.expenses)),
                  Expanded(child: mainContent),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: (expense) {
          context.read<ExpensesBloc>().add(AddExpense(expense));
          // Navigator.of(ctx).pop();
        },
      ),
    );
  }
}
