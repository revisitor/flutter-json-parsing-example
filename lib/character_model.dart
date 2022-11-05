class CharacterModel {
  final String nickname;
  final String imageUrl;

  CharacterModel({required this.nickname, required this.imageUrl});

  factory CharacterModel.fromJson(Map<String, dynamic> data) {
    return CharacterModel(
      nickname: data['nickname'] as String,
      imageUrl: data['img'] as String,
    );
  }
}
