import 'package:flutter/material.dart';
import '../features/home/home_view.dart';
import '../features/platform/platform_view.dart';
import '../features/game_detail/game_detail_view.dart';
import '../features/wishlist/wish_list_view.dart';

class AppRoutes {
  static const home = '/';
  static const platform = '/platform';
  static const gameDetail = '/game';
  static const wishList = '/wishlist';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case platform:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => PlatformView(
            consoleName: args?['consoleName'] ?? 'Nintendo Switch (NA)',
            owned: args?['owned'] ?? 123,
            total: args?['total'] ?? 4312,
          ),
        );
      case gameDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => GameDetailView(gameTitle: args?['title'] ?? 'Metroid Dread'),
        );
      case wishList:
        return MaterialPageRoute(builder: (_) => const WishListView());
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
