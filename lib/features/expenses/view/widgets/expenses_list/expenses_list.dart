import 'package:flutter/material.dart';
import 'package:tracker/features/expenses/model/expense.dart';
import 'package:tracker/features/expenses/view/widgets/expenses_list/expenses_item.dart';
import 'package:tracker/main.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoved,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemCount: expenses.length,
      itemBuilder: (cxt, index) => Dismissible(
        background: Container(
          color: KColorScheme.error,
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20),
              Icon(Icons.delete_forever, color: Colors.white),
              SizedBox(width: 250),
              Icon(Icons.delete_forever, color: Colors.white),
              SizedBox(width: 20),
            ],
          ),
        ),
        onDismissed: (direction) {
          onRemoved(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
