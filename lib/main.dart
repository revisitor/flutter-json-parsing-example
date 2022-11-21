import 'package:flutter/material.dart';

import 'view/characters_list/characters_list_view.dart';

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
