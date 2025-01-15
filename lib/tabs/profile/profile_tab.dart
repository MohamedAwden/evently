import 'package:evently/tabs/profile/profile_header.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ProfileHeader(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Spacer(),
            
                InkWell(
                  onTap: (){},
                  child: Container(
                    margin:EdgeInsets.only(bottom: 10) ,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppTheme.red,borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: AppTheme.white,
                        ),
                        Text('Logout', style: textTheme.titleLarge,),
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
