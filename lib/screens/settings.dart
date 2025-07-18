import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect_four_flutter/app_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Here we use `context.select` to only listen to a specific part of the state.
    // This is a performance optimization. This widget will ONLY rebuild if
    // `isDarkMode` changes, not if `username` changes.
    final isDarkMode = context.select((AppState state) => state.isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // A text field to update the username.
            TextFormField(
              initialValue: context.read<AppState>().playerOne,
              decoration: const InputDecoration(
                labelText: 'Player One',
                border: OutlineInputBorder(),
              ),
              // When the text changes, we update the state.
              // We use `context.read` here because we are in a callback. We just
              // need to call a method, not listen for changes.
              onChanged: (String value) {
                context.read<AppState>().updatePlayerOne(value);
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: context.read<AppState>().playerTwo,
              decoration: const InputDecoration(
                labelText: 'Player Two',
                border: OutlineInputBorder(),
              ),
              // When the text changes, we update the state.
              // We use `context.read` here because we are in a callback. We just
              // need to call a method, not listen for changes.
              onChanged: (String value) {
                context.read<AppState>().updatePlayerTwo(value);
              },
            ),
            const SizedBox(height: 20),
            // A switch to toggle dark mode.
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: isDarkMode,
              onChanged: (bool value) {
                context.read<AppState>().toggleDarkMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}