import 'package:flutter/material.dart';

import '../../command/get_characters_command.dart';
import '../../model/character_model.dart';
import '../character/character_view.dart';
import '../common/loading_view.dart';
import 'characters_list.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  late final Future<Iterable<Character>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    _charactersFuture = _getCharacters();
  }

  Future<Iterable<Character>> _getCharacters() async {
    return GetCharactersCommand().run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Персонажи')),
      body: FutureBuilder(
        future: _charactersFuture,
        builder: (_, snapshot) => _getBody(snapshot),
      ),
    );
  }

  Widget _getBody(AsyncSnapshot<Iterable<Character>> snapshot) {
    if (snapshot.hasData) {
      Iterable<Character> characters = snapshot.data!;
      return CharactersList(characters, _showCharacterInfo);
    }

    if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    }

    return const LoadingView();
  }

  void _showCharacterInfo(BuildContext context, int characterId) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CharacterView(characterId: characterId)));
  }
}
