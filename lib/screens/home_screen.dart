import 'package:evently/tabs/home/home_tab.dart';
import 'package:evently/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

import '../tabs/favourite/favourite_tab.dart';
import '../tabs/map/map_tab.dart';
import '../tabs/profile/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    FavouriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarItem(
              imageName: 'Home',
            ),
            activeIcon: NavBarItem(
              imageName: 'selected_home',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: NavBarItem(
              imageName: 'Map',
            ),
            activeIcon: NavBarItem(
              imageName: 'selected_map',
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: NavBarItem(
              imageName: 'Heart',
            ),
            activeIcon: NavBarItem(
              imageName: 'selected_heart',
            ),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: NavBarItem(
              imageName: 'User',
            ),
            activeIcon: NavBarItem(
              imageName: 'selected_user',
            ),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
