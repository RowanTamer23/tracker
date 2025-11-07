import 'package:equatable/equatable.dart';
import 'package:tracker/features/expenses/model/expense.dart';

class ExpensesState extends Equatable {
  final List<Expense> expenses;
  final bool isLoading;
  final String? errorMessage;

  const ExpensesState({
    this.expenses = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  ExpensesState copyWith({
    List<Expense>? expenses,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ExpensesState(
      expenses: expenses ?? this.expenses,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [expenses, isLoading, errorMessage];
}
