import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../firebase_service.dart';
import '../modals/catgories.dart';
import '../modals/event.dart';
import '../providers/event_provider.dart';

class EventDetails extends StatelessWidget {
  EventDetails();

  static const String routeName = '/event-details';

  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)!.settings.arguments as Event;
    DateFormat dateFormat = DateFormat('dd/MMMM/yyyy');
    DateFormat timeFormat = DateFormat('hh:mm a');
    TextTheme textTheme = Theme.of(context).textTheme;
    final eventsProvider = Provider.of<EventsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              ('assets/icons/edit2.svg'),
              height: 30,
              width: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
          IconButton(
            onPressed: () {
              eventsProvider.deleteEvent(event.id).then((_) {
                Navigator.of(context).pop();
              });
            },
            icon: SvgPicture.asset(
              ('assets/icons/delete.svg'),
              height: 30,
              width: 30,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/${event?.category.imageName}.png',
                  height: MediaQuery.sizeOf(context).height * .25,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  event!.title,
                  style: textTheme.displayLarge?.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primary),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/cleander.png'),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${dateFormat.format(event!.dateTime)} ',
                            style: textTheme.labelLarge?.copyWith(
                              color: AppTheme.primary,
                            )),
                        Text(
                          '${timeFormat.format(event!.dateTime)} ',
                          style: textTheme.labelLarge,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primary),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/location.png'),
                    SizedBox(width: 8),
                    Text(
                      'Cairo , Egypt ',
                      style: textTheme.labelLarge?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/location_map.png',
                height: MediaQuery.sizeOf(context).height * .45,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Description',
                style: textTheme.labelLarge,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                event.description,
                style: textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
