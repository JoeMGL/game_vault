import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = [
      ('Paper Mario: The Thousand-Year Door', 'Switch • Target price: \$40'),
      ('Chrono Trigger', 'SNES • Target price: \$120'),
      ('Bloodborne', 'PS4 • Target price: \$15'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Wish List')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 6),
        itemBuilder: (_, i) {
          final e = items[i];
          return Card(
            child: ListTile(
              leading: Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12))),
              title: Text(e.$1, style: theme.textTheme.titleMedium),
              subtitle: Text(e.$2, style: theme.textTheme.bodyMedium),
              trailing: OutlinedButton(onPressed: () {}, child: const Text('Mark Acquired')),
            ),
          );
        },
      ),
    );
  }
}
