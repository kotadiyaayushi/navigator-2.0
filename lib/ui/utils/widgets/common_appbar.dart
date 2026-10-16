import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonAppbar extends ConsumerWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Color(0xFF312E2E),
          blurRadius: 0.5,
          offset: Offset(0, 0.2)
        )]
      ),
      child: AppBar(
        title: Text("Money Tracker",style: TextStyle(
          fontSize: 17
        ),),
        centerTitle: true,

        // backgroundColor: Colors.red,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(Icons.sort,size: 24,color: Color(0xFFDCDCDC),),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            spacing: 6,
            children: [
              Icon(Icons.search,size: 24,color: Color(0xFFDCDCDC),),Icon(Icons.calendar_month_outlined,size: 24,color: Color(0xFFDCDCDC),),
            ],
          ),
        )],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}