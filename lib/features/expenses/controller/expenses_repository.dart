// import 'package:flutter/material.dart';
// import 'package:tracker/features/expenses/model/expense.dart';
// import 'package:tracker/features/expenses/view/screens/new_expense.dart';

// class ExpensesRepository {
//   var context;

//   ExpensesRepository({required this.context});

//   final List<Expense> registeredExpenses = [
//     Expense(
//       title: 'Coffee',
//       amount: 4.99,
//       date: DateTime.now(),
//       category: Category.food,
//     ),
//     Expense(
//       title: 'Coffee',
//       amount: 4.99,
//       date: DateTime.now(),
//       category: Category.food,
//     ),
//   ];

//   void openAddExpenceOverlay() {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (ctx) => NewExpense(onAddExpense: addExpense),
//     );
//   }

//   void addExpense(Expense expense) {
//     registeredExpenses.add(expense);
//   }

//   void removeExpense(Expense expense) {
//     final expenseIndex = registeredExpenses.indexOf(expense);

//     registeredExpenses.remove(expense);

//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: Duration(seconds: 3),
//         content: const Text('Expense Deleted'),
//         action: SnackBarAction(
//           label: 'Undo',
//           onPressed: () {
//             registeredExpenses.insert(expenseIndex, expense);
//           },
//         ),
//       ),
//     );
//   }
// }
