import 'package:evently/auth/login_screen.dart';
import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:evently/widgets/event_details.dart';
import 'package:evently/widgets/event_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EventsProvider(),
      ), ChangeNotifierProvider(
        create: (_) => UserProvider(),
      )
    ],
    child: EventlyApp(),
  ));
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        CreateEventScreen.routeName: (_) => CreateEventScreen(),
        EventDetails.routeName: (_) => EventDetails(),
      },
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
