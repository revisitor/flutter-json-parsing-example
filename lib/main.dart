import 'package:characters_info_app/character_view.dart';
import 'package:flutter/material.dart';

void main() {
  const app = CharactersInfoApplication();
  runApp(app);
}

class CharactersInfoApplication extends StatelessWidget {
  const CharactersInfoApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CharactersView(),
    );
  }
}
