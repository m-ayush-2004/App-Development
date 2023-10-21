import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      ammount: 220,
      title: "Flutter Course",
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      ammount: 220,
      title: "Cinema",
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      ammount: 220,
      title: "Meet voldomort",
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  Widget mainContent = const Center(
    child: Text('No expense found. Start adding some!'),
  );

  void _onRemoveExpense(Expense expense) {
    _registeredExpense.remove(expense);
    SnackBar(
      content: const Text('Expense Deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpense,
        onRemoveExpense: _onRemoveExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense,onRemoveExpense: _onRemoveExpense,),
          ),
        ],
      ),
    );
  }
}
