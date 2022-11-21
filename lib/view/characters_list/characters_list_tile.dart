import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../model/character_model.dart';

const double _avatarSize = 50;

class CharacterTile extends StatelessWidget {
  late final String _nickname;
  late final String _imageUrl;

  CharacterTile(Character character, {super.key}) {
    _nickname = character.nickname;
    _imageUrl = character.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_nickname),
      leading: CachedNetworkImage(
        imageUrl: _imageUrl,
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const _DefaultImage(),
      ),
    );
  }
}

class _DefaultImage extends StatelessWidget {
  const _DefaultImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/person.png',
      width: _avatarSize,
      height: _avatarSize,
      fit: BoxFit.fill,
    );
  }
}
