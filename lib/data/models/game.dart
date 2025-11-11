class Game {
  final String gameId;
  final String title;
  final String platform;
  final String publisher;
  final String region;
  final String? coverUrl;
  final DateTime? releaseDate;

  Game({
    required this.gameId,
    required this.title,
    required this.platform,
    required this.publisher,
    required this.region,
    this.coverUrl,
    this.releaseDate,
  });
}
