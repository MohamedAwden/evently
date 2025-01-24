import 'package:evently/modals/user_modal.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
UserModal user=    Provider.of<UserProvider>(context, listen: false).currentUser!;
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
                  user.name,
                  style: textTheme.displayLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  user.email,
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
