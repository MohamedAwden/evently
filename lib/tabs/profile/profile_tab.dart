import 'package:evently/auth/login_screen.dart';
import 'package:evently/firebase_service.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/tabs/profile/profile_header.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ProfileHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 16.0,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Theme',
                      style: textTheme.titleLarge?.copyWith(
                          color: settingsProvider.isDark
                              ? AppTheme.white
                              : AppTheme.black),
                    ),
                    Switch(
                      value: settingsProvider.isDark,
                      onChanged: (isDark) {
                        settingsProvider
                            .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                      },
                    ),

                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    FirebaseService.logout();
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                    Provider.of<UserProvider>(context, listen: false)
                        .updateCUrrrentUser(null);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppTheme.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: AppTheme.white,
                        ),
                        Text(
                          'Logout',
                          style: textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
