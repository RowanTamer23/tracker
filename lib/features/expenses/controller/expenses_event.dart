import 'package:tracker/features/expenses/model/expense.dart';
import 'package:equatable/equatable.dart';

abstract class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object?> get props => [];
}

class LoadExpenses extends ExpensesEvent {}

class AddExpense extends ExpensesEvent {
  final Expense expense;
  const AddExpense(this.expense);

  @override
  List<Object?> get props => [expense];
}

class RemoveExpense extends ExpensesEvent {
  final Expense expense;
  const RemoveExpense(this.expense);

  @override
  List<Object?> get props => [expense];
}
