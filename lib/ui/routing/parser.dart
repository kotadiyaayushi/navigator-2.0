import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_keys.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/cupertino.dart';

class MainRouteInformationParser extends RouteInformationParser<NavigationStack>{

  @override
  Future<NavigationStack> parseRouteInformation(RouteInformation routeInformation) async{
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
    for(final segment in segments){
      NavigationStackKeyMapper.mapper.currentKey = segment;
      if(segment == 'home'){
        items.add(NavigationStackItem.home());
      }
      else if(segment == 'detail'){
        items.add(NavigationStackItem.detail());
      }
      else{
        debugPrint('UNKNOWN PATH = $path');
        return NavigationStack([NavigationStackItem.home()]);
      }
    }

    return NavigationStack(items);

  }
  @override
  RouteInformation? restoreRouteInformation(NavigationStack configuration) {
    // TODO: implement restoreRouteInformation
    // final lastItem = configuration.items.last;
    String path = '';
    for(final item in configuration.items){
      final key = NavigationStackKeyMapper.key(item);
      path = '$path/$key';
    }

    NavigationStackKeyMapper.mapper.keyList = configuration.items.map(
        (item){
          return NavigationStackKeyMapper.key(item);
        }
    ).toList();

    return RouteInformation(
      uri: Uri.parse(path)
    );
  }
}