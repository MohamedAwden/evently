import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/modals/catgories.dart';
import 'package:flutter/material.dart';

class Event {
  String id;
  String userId;
  String title;
  Catgories category;
  String description;
  DateTime dateTime;

  Event({
    this.id = '',
    required this.userId,
    required this.title,
    required this.category,
    required this.description,
    required this.dateTime,
  });

  Event.fromJason(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userId: json['userId'],
          title: json['title'],
          category: Catgories.categories
              .firstWhere((category) =>   category.id == json['categoryId']),
          description: json['description'],
          dateTime: (json['timeStamp'] as Timestamp).toDate(),
        );

  Map<String, dynamic> toJason() => {
        'id': id,
        'userId': userId,
        'title': title,
        'categoryId': category.id,
        'description': description,
        'timeStamp': Timestamp.fromDate(dateTime),
      };
}
