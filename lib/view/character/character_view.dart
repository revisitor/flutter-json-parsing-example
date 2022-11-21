import 'package:flutter/material.dart';

import '../../command/get_character_command.dart';
import '../../model/character_model.dart';
import '../common/loading_view.dart';

class CharacterView extends StatefulWidget {
  final int characterId;

  const CharacterView({required this.characterId, super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late final Future<Character> _characterModelFuture;

  @override
  void initState() {
    super.initState();
    _characterModelFuture = _getCharacterModel();
  }

  Future<Character> _getCharacterModel() async {
    return GetCharacterCommand(widget.characterId).run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Данные персонажа'),
      ),
      body: FutureBuilder(
          future: _characterModelFuture,
          builder: (context, snapshot) => _getBody(snapshot)),
    );
  }

  Widget _getBody(AsyncSnapshot<Character> snapshot) {
    if (!snapshot.hasData) {
      return const LoadingView();
    }

    Character character = snapshot.data!;
    return Column(
      children: [
        Image.network(
          character.imageUrl,
          errorBuilder: (context, exception, stackTrace) {
            return const Text('Could not load image');
          },
        ),
        Text(character.name),
      ],
    );
  }
}
