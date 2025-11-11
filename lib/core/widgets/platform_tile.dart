import 'package:flutter/material.dart';

class PlatformTile extends StatelessWidget {
  final String name;
  final int percent;
  final VoidCallback? onTap;
  const PlatformTile({required this.name, required this.percent, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: theme.textTheme.titleMedium),
              const Spacer(),
              LinearProgressIndicator(
                value: percent / 100.0,
                backgroundColor: Colors.white12,
                color: theme.colorScheme.primary,
                minHeight: 8,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              const SizedBox(height: 8),
              Text('$percent% complete', style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
