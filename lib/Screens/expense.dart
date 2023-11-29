import 'package:expese_project/Screens/expenseList.dart';
import 'package:expese_project/Screens/newExpense.dart';
import 'package:expese_project/charts/chart.dart';
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
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (
        ctx,
      ) =>
          NewExpense(
        onAddExpense: _addNewExpense,
      ),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _expenseCategory.add(expense);
    });
  }

  void _removeNewExpense(Expense expense) {
    final expenseIndex = _expenseCategory.indexOf(expense);
    setState(() {
      _expenseCategory.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _expenseCategory.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No Expense is Found,Start Adding Some!'),
    );
    if (_expenseCategory.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _expenseCategory,
        onRemoveExpense: _removeNewExpense,
      );
    }
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Expense Tracker",
              style: TextStyle(letterSpacing: 3),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: _openAddExpense,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: width < 600
              ? Column(
                  children: [
                    Chart(expenses: _expenseCategory),
                    Expanded(child: mainContent),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Chart(expenses: _expenseCategory),
                    ),
                    Expanded(child: mainContent),
                  ],
                )),
    );
  }
}
