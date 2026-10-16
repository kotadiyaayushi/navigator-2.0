import 'dart:math';

import 'package:expense_tracker_app/framework/controller/expense_controller.dart';
import 'package:expense_tracker_app/framework/expense_category.dart';
import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  final NavigationStack stack;
  DashboardScreen({required this.stack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseController);
    var totalExpense = expenses.fold(0.0, (total, expense) {
      return total + expense.amount;
    });
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color(0xFF171717),
              child: Column(
                children: [
                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFF292929)),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '12 Oct Monday',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Spacer(),
                        Text(
                          'Expenses: ₹${totalExpense.toStringAsFixed(2)}   Income: 5,000',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: expenses.isEmpty
                        ? Center(child: Text("No expenses yet"))
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: expenses.length,
                            itemBuilder: (context, index) {
                              final expense = expenses[index];

                              return _buildTransaction(
                                expense:expense,
                                icon: switch (expense.category) {
                                  ExpenseCategory.food => Icons.restaurant,
                                  ExpenseCategory.travel => Icons.directions_car,
                                  ExpenseCategory.shopping => Icons.shopping_bag,
                                  ExpenseCategory.bills => Icons.receipt,
                                  ExpenseCategory.health => Icons.medical_services,
                                  ExpenseCategory.education => Icons.school,
                                  ExpenseCategory.other => Icons.category,
                                },
                                title: expense.title,
                                amount: expense.amount.toStringAsFixed(2),
                                category: expense.category.name,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     stack.push(NavigationStackItem.detail());
          //   },
          //   child: const Text('Detail screen'),
          // ),
        ],
      ),
    );
  }

  Widget _buildTransaction({
    required Expense expense,
    required IconData icon,
    required String title,
    required String amount,
    required String category,
  }) {
    return SizedBox(
      height: 52,
      child: InkWell(
        onTap: (){
          stack.push(NavigationStackItem.detail(expense: expense));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6B638),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
