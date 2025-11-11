import 'package:flutter/material.dart';
import '../../core/widgets/section_header.dart';

class PlatformView extends StatelessWidget {
  final String consoleName;
  final int owned;
  final int total;
  const PlatformView(
      {required this.consoleName,
      required this.owned,
      required this.total,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double percent = total == 0 ? 0 : (owned / total);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(consoleName)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '$owned / $total owned • ${(percent * 100).toStringAsFixed(1)}% complete',
                      style: theme.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: percent, minHeight: 10),
                ],
              ),
            ),
          ),
          const _FilterChips(),
          const Divider(height: 1),
          const SectionHeader(title: 'All Games'),
          const Expanded(child: _GameList()),
        ],
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 8,
        children: [
          FilterChip(
              label: Text('Physical Only'), selected: true, onSelected: null),
          FilterChip(
              label: Text('Year: All'), selected: false, onSelected: null),
          FilterChip(
              label: Text('Publisher: All'), selected: false, onSelected: null),
          FilterChip(
              label: Text('Series: Mario'), selected: false, onSelected: null),
        ],
      ),
    );
  }
}

class _GameList extends StatelessWidget {
  const _GameList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = [
      (
        'The Legend of Zelda: Tears of the Kingdom',
        'Nintendo • 2023 • Exclusive',
        true
      ),
      ('Mario Kart 8 Deluxe', 'Nintendo • 2017', false),
      ('Hollow Knight', 'Team Cherry • 2018', false),
      ('Metroid Dread (Steelbook)', 'Nintendo • 2021 • Variant', true),
    ];
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (_, i) {
        final e = items[i];
        return Card(
          child: ListTile(
            leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12))),
            title: Text(e.$1, style: theme.textTheme.titleMedium),
            subtitle: Text(e.$2, style: theme.textTheme.bodyMedium),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text(e.$3 ? '✔ Owned' : '+ Wish'),
            ),
          ),
        );
      },
    );
  }
}
