import 'package:flutter/material.dart';

import '../../model/character_model.dart';
import 'characters_list_tile.dart';

class CharactersList extends StatelessWidget {
  final Iterable<Character> _characters;
  final void Function(BuildContext, int) _onTap;

  const CharactersList(this._characters, this._onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _characters.length,
        itemBuilder: (_, index) {
          final character = _characters.elementAt(index);
          return InkWell(
            onTap: () => _onTap(context, character.id),
            child: CharacterTile(character),
          );
        });
  }
}
