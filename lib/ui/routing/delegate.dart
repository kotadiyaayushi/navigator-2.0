import 'package:expense_tracker_app/ui/detail/detail_screen.dart';
import 'package:expense_tracker_app/ui/home/home_screen.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_keys.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class MainRouterDelegate extends RouterDelegate<NavigationStack>
with ChangeNotifier, PopNavigatorRouterDelegateMixin{
  final NavigationStack stack;
  MainRouterDelegate(this.stack){
    stack.addListener(notifyListeners);
  }

  @override
  // TODO: implement navigatorKey
  final navigatorKey = globalNavigatorKey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(
      builder: (context, ref, child){
        return Navigator(
          key: navigatorKey,
          pages: _buildPages(ref),
          onPopPage: (route,result){
            if (!route.didPop(result)) {
              return false;
            }
            if(stack.items.length == 1){
              return false;
            }

            if(stack.items.isEmpty){
              return false;
            }

            stack.pop();
            return true;
          },
        );
      },
    );
  }

  List<Page> _buildPages(WidgetRef ref){
    return stack.items.asMap().entries.map((entry){
      final index = entry.key;
      final item = entry.value;
      return buildPageFromNavigationItem(item, index);
    }).toList();
  }

  Page buildPageFromNavigationItem(NavigationStackItem item, int index){
    return item.when(
        home: (){
          return MaterialPage(
            key: ValueKey('${NavigationStackKeyMapper.key(item)}_$index'),
              child: HomeScreen(stack: stack));
        },
        detail: (){
          return MaterialPage(
            key: ValueKey('${NavigationStackKeyMapper.key(item)}_$index'),
              child: DetailScreen());
        });
  }

  @override
  // TODO: implement currentConfiguration
  NavigationStack get currentConfiguration{
    return stack;
  }

  @override
  Future<void> setNewRoutePath(NavigationStack configuration)async{
    // TODO: implement setNewRoutePath

    stack.items = configuration.items;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    stack.removeListener(notifyListeners);
    super.dispose();
  }

}