import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../modals/event.dart';

class EventItem extends StatelessWidget {
  Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, );
    bool isFavourite = userProvider.checkIsEventFavourite(event.id);
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${event.category.imageName}.png',
            width: double.infinity,
            height: screenSize.height * 0.26,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Text(
                  '${event.dateTime.day}',
                  style: textTheme.titleLarge?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  DateFormat('MMM').format(event.dateTime),
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            width: screenSize.width - 32,
            bottom: 5,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.title,
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isFavourite) {
                        userProvider.removeEventToFavourites(event.id);
                      } else {
                        userProvider.addEventToFavourites(event.id);
                      }

                    },
                    icon: Icon(
                      isFavourite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_outlined,
                      color: AppTheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
