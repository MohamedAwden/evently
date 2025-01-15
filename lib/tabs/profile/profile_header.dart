import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(64),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              'assets/images/route_logo.png',
              height: MediaQuery.sizeOf(context).height * .12,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mohamed Awden',
                  style: textTheme.displayMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'mohamed@gamil.com',
                  style: textTheme.bodyLarge?.copyWith(color: AppTheme.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
