import 'package:evently/auth/login_screen.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'auth/register_screen.dart';

void main (){
  runApp(EventlyApp());
}
class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName : (_) => LoginScreen(),
        RegisterScreen.routeName : (_) => RegisterScreen(),
        HomeScreen.routeName : (_) => HomeScreen(),
        CreateEventScreen.routeName : (_) => CreateEventScreen(),
      },
      initialRoute:HomeScreen.routeName ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
