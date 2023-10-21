import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses_app/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';
  final _titleControler = TextEditingController();
  final _ammountControler = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _submitExpenseData() {
    final enterdAmount = double.tryParse(_ammountControler.text);
    if (enterdAmount == null ||
        _titleControler.text.trim().isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please enter some valid Title, Ammount, Date and Category'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
    widget.onAddExpense(
      Expense(
          title: _titleControler.text,
          ammount: enterdAmount!,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleControler.dispose();
    _ammountControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleControler,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            // keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // onChanged: _saveTitleInput,
                  controller: _ammountControler,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Expense in .USD'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 26),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase().toString()),
                      ),
                    )
                    .toList(),
                onChanged: (vales) {
                  if (vales == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = vales;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: const Color.fromARGB(255, 49, 199, 74),
                // ),
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Color.fromARGB(255, 255, 85, 85),
                // ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
