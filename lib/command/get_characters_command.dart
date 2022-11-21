import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/character_model.dart';

class GetCharactersCommand {
  final Uri _url = Uri.https('www.breakingbadapi.com', 'api/characters');

  Future<Iterable<Character>> run() async {
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      return decodedResponse.map((object) => Character.fromJson(object));
    }

    throw Exception('Ошибка при загрузке персонажей');
  }
}
