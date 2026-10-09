import 'package:expense_tracker_app/ui/routing/delegate.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/parser.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends ConsumerState<MyApp>{
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
     routeInformationParser: MainRouteInformationParser(),
   );
  }
}