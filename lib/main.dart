import 'package:expense_tracker_app/framework/controller/expense_controller.dart';
import 'package:expense_tracker_app/ui/routing/delegate.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/parser.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(ProviderScope(child: Expense_tracker()));
}

class Expense_tracker extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _Expense_tracker();
  }
}

class _Expense_tracker extends ConsumerState<Expense_tracker>{
  final NavigationStack stack = NavigationStack([
    NavigationStackItem.home(),
  ]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('MYAPP BUILD');

    return MaterialApp.router(
     debugShowCheckedModeBanner: false,
     routerDelegate: MainRouterDelegate(stack),
     routeInformationParser: MainRouteInformationParser(getExpenseById: (id){
       ref.read(expenseController.notifier).getExpenseById(id);
     }),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF1F1F1F),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          surface: Colors.black
        )
      ),
   );
  }
}