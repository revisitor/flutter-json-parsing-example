import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/character_model.dart';

class GetCharactersCommand {
  final Uri _url = Uri.parse('https://breakingbadapi.com/api/characters');

  Future<Iterable<Character>> run() async {
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      debugPrint('Characters have been received');
      List<dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse.map((object) => Character.fromJson(object));
    }

    throw Exception('Ошибка при загрузке персонажей');
  }
}
