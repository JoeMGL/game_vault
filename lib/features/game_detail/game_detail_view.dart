import 'package:flutter/material.dart';

class GameDetailView extends StatelessWidget {
  final String gameTitle;
  const GameDetailView({required this.gameTitle, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Hero cover area
          SizedBox(
            height: 300,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Colors.black26),
                Container(
                    decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                )),
                Positioned(
                  left: 20,
                  bottom: 16,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(gameTitle, style: theme.textTheme.headlineLarge),
                      const SizedBox(height: 6),
                      Text('Nintendo Switch • 2021',
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Ownership Summary
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _Chip(text: 'Mint'),
                  _Chip(text: 'CIB'),
                  _Chip(text: 'Standard • NA'),
                  _Chip(text: 'Location: Shelf A'),
                ],
              ),
            ),
          ),
          // Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Owned'))),
                const SizedBox(width: 12),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('For Sale'))),
                const SizedBox(width: 12),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('For Trade'))),
              ],
            ),
          ),
          // Valuation
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  _Stat(label: 'Price Paid', value: '\$39.99'),
                  SizedBox(width: 24),
                  _Stat(label: 'Est. Market', value: '\$44'),
                  SizedBox(width: 24),
                  _Stat(label: 'Purchased', value: 'Apr 12, 2024'),
                ],
              ),
            ),
          ),
          // Notes & Photos
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Notes & Photos', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) => Container(
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(12))),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemCount: 3,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  const _Chip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;
  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 6),
          Text(value, style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}
