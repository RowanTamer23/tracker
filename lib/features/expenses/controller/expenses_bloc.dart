import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/features/expenses/model/expense.dart';
import 'expenses_event.dart';
import 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesBloc() : super(const ExpensesState()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<RemoveExpense>(_onRemoveExpense);
  }

  void _onLoadExpenses(LoadExpenses event, Emitter<ExpensesState> emit) {
    emit(state.copyWith(isLoading: true));

    final initialExpenses = [
      Expense(
        title: 'Coffee',
        amount: 4.99,
        date: DateTime.now(),
        category: Category.food,
      ),
      Expense(
        title: 'Groceries',
        amount: 22.50,
        date: DateTime.now(),
        category: Category.food,
      ),
    ];

    emit(state.copyWith(isLoading: false, expenses: initialExpenses));
  }

  void _onAddExpense(AddExpense event, Emitter<ExpensesState> emit) {
    final updated = List<Expense>.from(state.expenses)..add(event.expense);
    emit(state.copyWith(expenses: updated));
  }

  void _onRemoveExpense(RemoveExpense event, Emitter<ExpensesState> emit) {
    final updated = List<Expense>.from(state.expenses)..remove(event.expense);
    emit(state.copyWith(expenses: updated));
  }
}
