import 'package:expese_project/models/expenseModel.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(expense.title),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                '\$${expense.amount.toStringAsFixed(2)}',
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    ExpenseIcon[expense.category],
                  ),
                  Text(
                    expense.formattedDate,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
