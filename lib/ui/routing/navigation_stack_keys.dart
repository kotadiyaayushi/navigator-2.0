import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';

class NavigationStackKeyMapper{
  NavigationStackKeyMapper._();
  static final NavigationStackKeyMapper mapper = NavigationStackKeyMapper._();

  List<String> keyList = [];
  String currentKey = '';
  static Map<String, String> keyValueMapper ={};
  static String value(String key){
    return keyValueMapper[key] ?? '';
  }



  static String key(NavigationStackItem item){
    return item.when(
        home: (){
          return 'home';
        },

        detail: (){
          return 'detail';
        });
  }
}