import 'package:evently/auth/login_screen.dart';
import 'package:evently/providers/event_provider.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/home_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:evently/widgets/event_details.dart';
import 'package:evently/widgets/event_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsProvider = SettingsProvider();
  await ProfileTab.retrieveThemeAndLanguage(settingsProvider);
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EventsProvider()..getEvents(),
      ), ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),ChangeNotifierProvider(
        create: (_) => settingsProvider,  // Use the existing settingsProvider instance
      )
    ],
    child: EventlyApp(),
  ));
}


class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider =Provider.of<SettingsProvider>(context);
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
      themeMode:settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
