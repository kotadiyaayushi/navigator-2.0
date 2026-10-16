import 'package:expense_tracker_app/ui/add_transaction/add_transaction_screen.dart';
import 'package:expense_tracker_app/ui/dashboard/dashboard_screen.dart';
import 'package:expense_tracker_app/ui/detail/detail_screen.dart';
import 'package:expense_tracker_app/ui/routing/navigation_stack_item.dart';
import 'package:expense_tracker_app/ui/routing/stack.dart';
import 'package:expense_tracker_app/ui/utils/widgets/common_appbar.dart';
import 'package:expense_tracker_app/ui/utils/widgets/common_bottombar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final NavigationStack stack;

  const HomeScreen({super.key, required this.stack});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int selectedIndex = 0;
  late final List<Widget> screens;


  void openAddTransaction() {
    widget.stack.push(
      const NavigationStackItem.addTransaction(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    screens = [
      DashboardScreen(stack: widget.stack,),
      DashboardScreen(stack: widget.stack,),
      DashboardScreen(stack: widget.stack,),
      DashboardScreen(stack: widget.stack,),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(),

      body: screens[selectedIndex],

      bottomNavigationBar: CommonBottombar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        onAddTapped: openAddTransaction
      ),
    );
  }
}