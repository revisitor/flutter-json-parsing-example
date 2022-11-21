import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/character_model.dart';

class GetCharacterCommand {
  final int characterId;
  late final Uri _url;

  GetCharacterCommand(this.characterId) {
    _url = Uri.https('www.breakingbadapi.com', 'api/characters/$characterId');
  }

  Future<Character> run() async {
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      return Character.fromJson(decodedResponse.first);
    }

    throw Exception('Ошибка при загрузке персонажа');
  }
}
