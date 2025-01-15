import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

import '../../modals/catgories.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.catgories, required this.isSelected});

  Catgories catgories;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.white : Colors.transparent,
        border: Border.all(
          width: 1,
          color: AppTheme.white,
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
            color: isSelected ? AppTheme.primary : AppTheme.white,
          ),
          SizedBox(width: 16),
          Text(
            catgories.name,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? AppTheme.primary : AppTheme.white),
          ),
        ],
      ),
    );
  }
}
