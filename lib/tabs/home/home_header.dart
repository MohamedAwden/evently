import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
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
              Provider.of<UserProvider>(context).currentUser!.name,
              style: textTheme.displayLarge,
            ),
            SizedBox(height: 16),
            DefaultTabController(
              length: Catgories.categories.length + 1,
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                onTap: (index) {
                  if(currentIndex == index) return;
                  currentIndex = index;
                  eventsProvider.changeSelectedCategory(
                      index == 0 ? null : Catgories.categories[index - 1]);
                },
                tabs: [
                  TabItem(
                    label: 'All',
                    isSelected: currentIndex == 0,
                    selectedBackgroundColor: AppTheme.white,
                    selectedForegroundColor: AppTheme.primary,
                    unselectedForegroundColor: AppTheme.white,
                    icon: Icons.grid_3x3_outlined,
                  ),
                  ...Catgories.categories.map(
                    (category) => TabItem(
                      label: category.name,
                      isSelected: currentIndex ==
                          Catgories.categories.indexOf(category) + 1,
                      selectedBackgroundColor: AppTheme.white,
                      selectedForegroundColor: AppTheme.primary,
                      unselectedForegroundColor: AppTheme.white,
                      icon: category.icon,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
