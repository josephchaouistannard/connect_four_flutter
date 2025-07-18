import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connect_four_flutter/app_state.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This is how a widget "listens" to the state.
    // `context.watch<AppState>()` gets the current state and rebuilds this
    // widget whenever `notifyListeners()` is called in AppState.
    final AppState appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect Four'),
        actions: <Widget>[
          // This button takes us to the settings page.
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(7, (int x) {
                return Column(
                  children: List.generate(6, (int y) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 75,
                        height: 75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appState.gamePositions[x][y],
                          ),
                          onPressed: appState.toggleDarkMode,
                          child: null,
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: appState.playerOneColour,
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '${appState.playerOne}\'s turn',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
