import 'package:evently/providers/event_provider.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:evently/tabs/home/home_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/event_details.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    if (eventsProvider.events.isEmpty) {
      eventsProvider.getEvents();
    }
    return Column(
      children: [
        const HomeHeader(),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  EventDetails.routeName,
                  arguments: eventsProvider.events[index],
                );
              },
              child: EventItem(eventsProvider.events[index]),
            ),
            itemCount: eventsProvider.events.length,
            separatorBuilder: (context, int index) => SizedBox(
              height: 16,
            ),
          ),
        ),
      ],
    );
  }
}
