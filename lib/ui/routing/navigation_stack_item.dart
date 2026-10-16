import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_stack_item.freezed.dart';

@freezed
class NavigationStackItem with _$NavigationStackItem {
  const factory NavigationStackItem.home() = NavigationStackItemHome;
  const factory NavigationStackItem.detail({
    required Expense expense
}) = NavigationStackItemDetail;


  const factory NavigationStackItem.addTransaction({
    Expense? expense,
  }) = NavigationStackItemAddTransaction;


}