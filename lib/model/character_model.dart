class Character {
  final int id;
  final String name;
  final String nickname;
  final String imageUrl;

  Character({
    required this.id,
    required this.name,
    required this.nickname,
    required this.imageUrl,
  });

  factory Character.fromJson(Map<String, dynamic> data) {
    return Character(
      id: data['char_id'] as int,
      name: data['name'] as String,
      nickname: data['nickname'] as String,
      imageUrl: data['img'] as String,
    );
  }
}
