import 'package:evently/tabs/home/tab_item.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

import '../../modals/catgories.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        bottom: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: textTheme.bodyMedium?.copyWith(
                color: AppTheme.white,
              ),
            ),
            Text(
              'Mohamed Awden',
              style: textTheme.displayLarge,
            ),
            SizedBox(height: 16),
            DefaultTabController(
              length: Catgories.categories.length,
              child: TabBar(
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {

                  });
                },
                tabs: Catgories.categories
                    .map(
                      (category) => TabItem(
                        catgories: category,
                        isSelected: currentIndex ==
                            Catgories.categories.indexOf(category),

                      ),
                    )
                    .toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
