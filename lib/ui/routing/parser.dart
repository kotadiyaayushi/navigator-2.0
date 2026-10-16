import 'package:expense_tracker_app/framework/expense_model.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_keys.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/cupertino.dart';

class MainRouteInformationParser extends RouteInformationParser<NavigationStack>{

  final Expense? Function(String id) getExpenseById;

  MainRouteInformationParser({
    required this.getExpenseById,
  });

  @override
  Future<NavigationStack> parseRouteInformation(RouteInformation routeInformation,)
  async{
    // TODO: implement parseRouteInformation
    final uri = routeInformation.uri;
    final path = uri.path;
    final segments = uri.pathSegments;

    NavigationStackKeyMapper.mapper.keyList = segments;

    debugPrint('URI = $uri');
    debugPrint('PATH = $path');
    if(segments.isEmpty){
      return NavigationStack([
        NavigationStackItem.home()
      ]);
    }
    final items = <NavigationStackItem>[];
    int i = 0;

    while (i < segments.length) {
      final segment = segments[i];

      NavigationStackKeyMapper.mapper.currentKey = segment;

      if (segment == 'home') {
        items.add(NavigationStackItem.home());
        i++;
      } else if (segment == 'add') {
        items.add(NavigationStackItem.addTransaction());
        i++;
      } else if (segment == 'detail') {
        if (i + 1 >= segments.length) {
          return NavigationStack([NavigationStackItem.home()]);
        }

        final expenseId = segments[i + 1];
        final expense = getExpenseById(expenseId);

        if (expense == null) {
          debugPrint('Expense not found: $expenseId');
          return NavigationStack([NavigationStackItem.home()]);
        }

        items.add(NavigationStackItem.detail(expense: expense));
        i += 2;
      } else if (segment == 'edit') {
        if (i + 1 >= segments.length) {
          return NavigationStack([NavigationStackItem.home()]);
        }

        final expenseId = segments[i + 1];
        final expense = getExpenseById(expenseId);

        if (expense == null) {
          debugPrint('Expense not found: $expenseId');
          return NavigationStack([NavigationStackItem.home()]);
        }

        items.add(NavigationStackItem.addTransaction(expense: expense));
        i += 2;
      } else {
        debugPrint('UNKNOWN PATH = ${uri.path}');
        return NavigationStack([NavigationStackItem.home()]);
      }
    }

    return NavigationStack(items);

  }


  @override
  RouteInformation? restoreRouteInformation(
      NavigationStack configuration) {
    final pathSegments = <String>[];

    for (final item in configuration.items) {
      item.when(
        home: () {
          pathSegments.add('home');
        },
        detail: (expense) {
          pathSegments.add('detail');
          pathSegments.add(expense.id);
        },
        addTransaction: (expense) {
          if (expense == null) {
            pathSegments.add('add');
          } else {
            pathSegments.add('edit');
            pathSegments.add(expense.id);
          }
        },
      );
    }

    NavigationStackKeyMapper.mapper.keyList = pathSegments;

    return RouteInformation(
      uri: Uri.parse('/${pathSegments.join('/')}'),
    );
  }


}