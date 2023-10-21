import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text('\$${expense.ammount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(CategoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.FormattedDate)
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
