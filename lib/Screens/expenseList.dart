import 'package:expese_project/Screens/ExpenseItem.dart';
import 'package:flutter/material.dart';

import '../models/expenseModel.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItems(
          expenses[index],
        ),
      ),
    );
  }
}
