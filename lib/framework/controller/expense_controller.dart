import 'dart:math';

import 'package:expense_tracker_app/framework/expense_category.dart';
import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseController extends Notifier<List<Expense>>{
  @override
  List<Expense> build() {
    // TODO: implement build
    return [];
  }

  void addExpense(Expense expense){
    if(expense.amount <=0){
      throw ArgumentError('Amount must be greater than zero');
    }

    if(state.any((item){
      return item.id == expense.id;
    })){
      throw ArgumentError('Expense ID must be unique');
    }
    state = [...state,expense];
  }

  void deleteExpense(String id){
    state = state.where((expense){
      return expense.id != id;
    }).toList();
  }

  void updateExpense(Expense updateExpense){
    if(updateExpense.amount <=0){
      throw ArgumentError('Amount must be greater than zero');
    }
    if (!state.any((expense) => expense.id == updateExpense.id)) {
      return;
    }
    var updatedList = <Expense>[];

      for(var expense in state){
        if(expense.id == updateExpense.id){
          updatedList.add(updateExpense);
        }
        else{
          updatedList.add(expense);
        }
      }

      state = updatedList;
  }

  double get totalExpense{
    return state.fold(0, (total,expense){
      return total + expense.amount;
    });
  }

  List<Expense> getExpenseByCategory(ExpenseCategory category){
    return state.where((expense){
      return expense.category == category;
    }).toList();
  }

  Expense? getExpenseById(String id) {
    for (final expense in state) {
      if (expense.id == id) {
        return expense;
      }
    }

    return null;
  }
}

var expenseController = NotifierProvider<ExpenseController,List<Expense>>(
  ExpenseController.new
);

