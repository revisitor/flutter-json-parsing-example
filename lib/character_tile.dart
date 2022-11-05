import 'package:flutter/material.dart';

import 'character_model.dart';

class CharacterTile extends StatelessWidget {
  static const double _pictureSize = 50;

  static final _defaultImage = Image.asset(
    'assets/images/person.png',
    width: _pictureSize,
    height: _pictureSize,
    fit: BoxFit.fill,
  );

  final CharacterModel _character;

  const CharacterTile(this._character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_character.nickname),
      leading: Image(
        image: NetworkImage(_character.imageUrl),
        width: _pictureSize,
        height: _pictureSize,
        fit: BoxFit.fill,
        errorBuilder: (context, exception, stackTrace) => _defaultImage,
      ),
    );
  }
}
