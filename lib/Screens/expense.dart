import 'package:expese_project/Screens/expenseList.dart';
import 'package:expese_project/Screens/newExpense.dart';
import 'package:flutter/material.dart';

import '../models/expenseModel.dart';

class ExpensedScreen extends StatefulWidget {
  const ExpensedScreen({super.key});

  @override
  State<ExpensedScreen> createState() => _ExpensedScreenState();
}

class _ExpensedScreenState extends State<ExpensedScreen> {
  final List<Expense> _expenseCategory = [
    Expense(
        title: 'Flutter Project',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (
        ctx,
      ) =>
         NewExpense()
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expense Tracker"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _openAddExpense,
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Text("Chart Data"),
            Expanded(
              child: ExpenseList(
                expenses: _expenseCategory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
