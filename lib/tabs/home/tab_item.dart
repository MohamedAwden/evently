import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

import '../../modals/catgories.dart';

class TabItem extends StatelessWidget {
  TabItem({
    super.key,
    required this.catgories,
    required this.isSelected,
    required this.selectedBackgroundColor,
    required this.selectedForegroundColor,
    required this.unselectedForegroundColor,
  });

  Catgories catgories;
  bool isSelected;
  Color selectedBackgroundColor;
  Color selectedForegroundColor;
  Color unselectedForegroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectedBackgroundColor : Colors.transparent,
        border: isSelected
            ? null
            : Border.all(
                width: 1,
                color: unselectedForegroundColor,
              ),
        borderRadius: BorderRadius.circular(46),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            catgories.icon,
            color: isSelected
                ? selectedForegroundColor
                : unselectedForegroundColor,
          ),
          SizedBox(width: 16),
          Text(
            catgories.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected
                    ? selectedForegroundColor
                    : unselectedForegroundColor),
          ),
        ],
      ),
    );
  }
}
