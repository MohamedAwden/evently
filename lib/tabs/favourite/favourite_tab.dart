import 'package:evently/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/event_item.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DefaultTextFormField(
              onChanged: (query) {

              },
              prefixIconImage: 'search',
              hintText: 'Search for Event',
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => EventItem(),
                itemCount: 10,
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
