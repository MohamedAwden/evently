import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/event_item.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

      List<String> favouriteEventsIds =
          Provider.of<UserProvider>(context).currentUser!.favouriteEventsIds;
      eventsProvider.filterFavouriteEvents(favouriteEventsIds);


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DefaultTextFormField(
              onChanged: (query) {},
              prefixIconImage: 'search',
              hintText: 'Search for Event',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>EventItem(eventsProvider.favouriteEvents[index]),
                itemCount: eventsProvider.favouriteEvents.length,
                separatorBuilder: (context, int index) => SizedBox(
                  height: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
