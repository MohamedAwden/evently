import 'package:flutter/material.dart';

class Catgories {
  String id;
  String name;
  String imageName;
  IconData icon;

  Catgories({
    required this.id,
    required this.name,
    required this.imageName,
    required this.icon,
  });

  static List<Catgories> categories = [
    Catgories(
      id: '1',
      name: 'Sport',
      imageName: 'sport',
      icon: Icons.sports_basketball_outlined,
    ),
    Catgories(
      id: '2',
      name: 'Birthday',
      imageName: 'birthday',
      icon: Icons.cake_outlined,
    ),    Catgories(
      id: '3',
      name: 'Meeting',
      imageName: 'meeting',
      icon: Icons.laptop_chromebook_outlined,
    ),    Catgories(
      id: '4',
      name: 'Gaming',
      imageName: 'gaming',
      icon: Icons.gamepad_outlined,
    ),    Catgories(
      id: '5',
      name: 'Eating',
      imageName: 'eating',
      icon: Icons.food_bank_outlined,
    ),    Catgories(
      id: '6',
      name: 'Holiday',
      imageName: 'holiday',
      icon: Icons.beach_access_outlined,
    ),    Catgories(
      id: '7',
      name: 'Exhibition',
      imageName: 'exhibition',
      icon: Icons.lock_clock_outlined,
    ),    Catgories(
      id: '8',
      name: 'WorkShop',
      imageName: 'workshop',
      icon: Icons.work_history_outlined,
    ),    Catgories(
      id: '9',
      name: 'Book Club',
      imageName: 'book_club',
      icon: Icons.book_outlined,
    ),
  ];
}
