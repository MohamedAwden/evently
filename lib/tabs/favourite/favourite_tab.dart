import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/event_item.dart';

class FavouriteTab extends StatefulWidget {
  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  late EventsProvider eventsProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> favouriteEventsIds =
      Provider.of<UserProvider>(context,listen: false).currentUser!.favouriteEventsIds;
      eventsProvider.filterFavouriteEvents(favouriteEventsIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);

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
                itemBuilder: (context, index) =>
                    EventItem(eventsProvider.favouriteEvents[index]),
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
