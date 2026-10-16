import 'package:expense_tracker_app/framework/controller/expense_controller.dart';
import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:expense_tracker_app/ui/add_transaction/add_transaction_screen.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerWidget{
  final Expense expense;
  final NavigationStack stack;

  DetailScreen({required this.expense,required this.stack});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // TODO: implement build
    final currentExpense = ref.watch(expenseController).firstWhere(
          (item) => item.id == expense.id,
      orElse: () => expense,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            stack.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
            stack.push(
              NavigationStackItem.addTransaction(
                expense: currentExpense,
              ),
            );
          },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${currentExpense.title}'),
            const SizedBox(height: 12),
            Text('Amount: ₹${currentExpense.amount.toStringAsFixed(2)}'),
            const SizedBox(height: 12),
            Text('Category: ${currentExpense.category.name}'),
            const SizedBox(height: 12),
            Text('Date: ${currentExpense.date.toString()}'),
            if (currentExpense.note != null && currentExpense.note!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text('Note: ${currentExpense.note}'),
            ],
          ],
        ),
      ),
    );
  }
}