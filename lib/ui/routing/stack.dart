import 'dart:collection';

import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';

final navigationStackController = ChangeNotifierProvider((ref){
      return NavigationStack([NavigationStackItem.home()]);
    }
);

class NavigationStack extends ChangeNotifier {
  List<NavigationStackItem> _items;

  NavigationStack(List<NavigationStackItem> items) : _items =List.from(items);

  UnmodifiableListView<NavigationStackItem> get items{
    return UnmodifiableListView(_items);
  }

  set items(List<NavigationStackItem> newItems){
    _items = List.from(newItems);
    notifyListeners();
  }

  void push(NavigationStackItem item){
    _items.add(item);
    notifyListeners();
  }

  void pop(){
    if(_items.length>1){
      _items.removeLast();
      notifyListeners();
    }
  }

  void popUntill(NavigationStackItem until){
    if(_items.isNotEmpty){
      int index = _items.indexWhere((element){
        return element == until;
      });
      _items.removeRange(index+1, _items.length);
      notifyListeners();

    }

  }

  void pushRemove(NavigationStackItem item){
    if(_items.isNotEmpty){
      _items.removeLast();
      _items.add(item);
      notifyListeners();
    }
  }

  void pushRemoveUntil(NavigationStackItem item,NavigationStackItem until){
    if(_items.isNotEmpty){
      int index = _items.indexWhere((element){
        return element == until;
      });
      _items.removeRange(index+1, _items.length);
      _items.add(item);
      notifyListeners();
    }
  }

  void pushAndRemoveAll(NavigationStackItem item){
    _items..clear()..add(item);
    notifyListeners();

  }
}