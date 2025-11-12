import 'package:flutter/material.dart';

class PlatformTile extends StatelessWidget {
  final String name;
  final int percent;
  final double width; // NEW
  final VoidCallback? onTap;
  const PlatformTile({
    required this.name,
    required this.percent,
    this.onTap,
    this.width = 260, // default width for horizontal carousels
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        // <-- constrain width
        width: width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const Spacer(),
                ClipRRect(
                  // optional: rounded bar
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: LinearProgressIndicator(
                    value: percent / 100.0,
                    minHeight: 8,
                    backgroundColor: Colors.white12,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text('$percent% complete', style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
