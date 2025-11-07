import 'package:flutter/material.dart';
import 'package:tracker/features/expenses/model/expense.dart';
import 'package:tracker/main.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).brightness == Brightness.light
          ? Color.fromARGB(68, 0, 226, 143)
          : Color.fromARGB(202, 203, 228, 219),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    SizedBox(width: 8),
                    Text(
                      expense.formattedDate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
