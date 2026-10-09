import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final NavigationStack stack;
  HomeScreen({required this.stack});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          debugPrint('BUTTON PRESSED');

          stack.push(
             NavigationStackItem.detail(),
          );

        }, child: Text("Go to detail")),
      ),
    );
  }
}