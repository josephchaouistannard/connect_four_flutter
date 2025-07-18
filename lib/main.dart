import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect_four_flutter/app_state.dart';
import 'package:connect_four_flutter/screens/game.dart';
import 'package:connect_four_flutter/screens/settings.dart';

void main() {
  // The app starts here.
  // We wrap the entire app in a ChangeNotifierProvider. This creates one
  // instance of our AppState and makes it available to every widget in the app.
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We use context.watch here to listen for changes in AppState.
    // If isDarkMode changes, this entire MaterialApp will rebuild.
    final isDarkMode = context.watch<AppState>().isDarkMode;

    return MaterialApp(
      title: 'Two Page App',
      // This theme will change based on our AppState variable.
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,

      // The initial page the user sees.
      home: const GameScreen(),

      // Define the routes for navigating to other pages.
      routes: {
        '/game': (context) => const SettingsScreen(),
      },
    );
  }
}