import 'dart:convert';

import 'package:characters_info_app/character_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'character_model.dart';

class CharactersView extends StatefulWidget {
  static final _url =
      Uri.parse('https://www.breakingbadapi.com/api/characters/');

  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  late final Future<List<CharacterModel>> future;

  @override
  void initState() {
    super.initState();
    future = _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Персонажи'),
      ),
      body: FutureBuilder(
          future: future,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              final List<CharacterModel> characters = snapshot.data!;
              return ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_, index) => CharacterTile(characters[index]));
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<CharacterModel>> _getCharacters() async {
    final response = await http.get(CharactersView._url, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> parsedJson = jsonDecode(response.body);
      return parsedJson
          .map((data) => CharacterModel.fromJson(data))
          .toList(growable: false);
    }

    throw Exception('Ошибка при получении персонажей');
  }
}
