import 'package:expese_project/Screens/ExpenseItem.dart';
import 'package:flutter/material.dart';

import '../models/expenseModel.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItems(
        expenses[index],
      ),
    );
  }
}
