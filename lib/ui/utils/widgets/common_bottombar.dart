import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonBottombar extends ConsumerWidget implements PreferredSizeWidget {
  int selectedIndex;
  ValueChanged<int> onItemTapped;
  VoidCallback onAddTapped;

  CommonBottombar({
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onAddTapped,
  });

  @override
  Size get preferredSize =>  Size.fromHeight(76);

  Color backgroundColor = Color(0xFF1E1E1E);
  Color selectedColor = Color(0xFFFFD740);
  Color unselectedColor = Color(0xFF9E9E9E);

  Widget navItem(int index, IconData icon, String label) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          onItemTapped(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 25,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                color: isSelected ? selectedColor : unselectedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76,
          child: Row(
            children: [
              navItem(
                0,
                Icons.account_balance_wallet_outlined,
                'Home',
              ),

              Expanded(
                child: Center(
                  child: Transform.translate(
                    offset: Offset(0, -12),
                    child: GestureDetector(
                      onTap: () {
                        onAddTapped();
                      },
                      child: Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                          color: selectedColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          size: 34,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              navItem(
                1,
                Icons.description_outlined,
                'Reports',
              ),

            ],
          ),
        ),
      ),
    );
  }
}