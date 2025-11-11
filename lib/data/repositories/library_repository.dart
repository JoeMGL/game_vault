import '../models/game.dart';

class LibraryRepository {
  // TODO: connect to Firestore
  Future<List<Game>> recentAdds() async {
    return [
      Game(gameId: 'metroid-dread-switch', title: 'Metroid Dread', platform: 'Switch', publisher: 'Nintendo', region: 'NA', coverUrl: null, releaseDate: DateTime(2021,10,8)),
      Game(gameId: 'smb-wonder', title: 'Super Mario Bros. Wonder', platform: 'Switch', publisher: 'Nintendo', region: 'NA', coverUrl: null, releaseDate: DateTime(2023,10,20)),
    ];
  }
}
