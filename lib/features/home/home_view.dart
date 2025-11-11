import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/stat_card.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/platform_tile.dart';
import '../../routes/app_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.dark(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              title: const Text('GameVault'),
              actions: [
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () {}),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: StatCard(
                              icon: Icons.videogame_asset,
                              title: 'Games',
                              value: '284',
                              subtext: '+2 this week')),
                      Expanded(
                          child: StatCard(
                              icon: Icons.attach_money,
                              title: 'Value',
                              value: '\$7,820',
                              subtext: 'Top: Super Metroid')),
                      Expanded(
                          child: StatCard(
                              icon: Icons.dashboard_customize,
                              title: 'Platforms',
                              value: '9',
                              subtext: 'Most: Switch')),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.qr_code_scanner),
                              label: const Text('Scan'))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: const Text('Add'))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.upload_file),
                              label: const Text('Import'))),
                    ],
                  ),
                ),
                const SectionHeader(
                    title: 'Platform Progress',
                    actionLabel: 'View All Consoles'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 8),
                        PlatformTile(
                            name: 'Nintendo Switch (NA)',
                            percent: 28,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.platform,
                                  arguments: {
                                    'consoleName': 'Nintendo Switch (NA)',
                                    'owned': 123,
                                    'total': 4312
                                  });
                            }),
                        PlatformTile(
                            name: 'PS5 (NA)',
                            percent: 12,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.platform,
                                  arguments: {
                                    'consoleName': 'PS5 (NA)',
                                    'owned': 24,
                                    'total': 200
                                  });
                            }),
                        PlatformTile(
                            name: 'SNES (NA)',
                            percent: 62,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutes.platform,
                                  arguments: {
                                    'consoleName': 'SNES (NA)',
                                    'owned': 400,
                                    'total': 650
                                  });
                            }),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
                const SectionHeader(
                    title: 'Recent Additions', actionLabel: 'All Activity'),
                _RecentList(),
                const SizedBox(height: 32),
              ]),
            )
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          onDestinationSelected: (i) {},
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.video_library_outlined),
                selectedIcon: Icon(Icons.video_library),
                label: 'Library'),
            NavigationDestination(
                icon: Icon(Icons.smart_toy_outlined),
                selectedIcon: Icon(Icons.smart_toy),
                label: 'Consoles'),
            NavigationDestination(
                icon: Icon(Icons.storefront_outlined),
                selectedIcon: Icon(Icons.storefront),
                label: 'Market'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class _RecentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: List.generate(3, (i) {
          return Card(
            child: ListTile(
              leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12))),
              title: Text(
                  ['Metroid Dread', 'Super Mario RPG', 'Gran Turismo 7'][i],
                  style: theme.textTheme.titleMedium),
              subtitle: Text(
                  [
                    'Switch • Mint • CIB • \$39.99',
                    'Switch • Good • CIB • \$49.99',
                    'PS5 • Mint • \$29.99'
                  ][i],
                  style: theme.textTheme.bodyMedium),
              onTap: () => Navigator.pushNamed(context, AppRoutes.gameDetail,
                  arguments: {'title': 'Metroid Dread'}),
            ),
          );
        }),
      ),
    );
  }
}
