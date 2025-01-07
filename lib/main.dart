import 'package:evently/auth/login_screen.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

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
        LoginScreen.RouteName : (_) => LoginScreen(),
      },
      initialRoute:LoginScreen.RouteName ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
