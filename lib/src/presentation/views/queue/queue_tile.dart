import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/widgets/chip_widget.dart';

class QueueTile extends StatelessWidget {
  const QueueTile({
    Key? key,
    required this.name,
    required this.norm,
    required this.username,
    required this.queue,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String norm;
  final String username;
  final String queue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.grey5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.person_outline,
            size: 44,
            color: ThemeColors.grey5,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name - $norm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      username,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GreenChip(queue),
        ],
      ),
    );

    return GestureDetector(onTap: onTap, child: container);
  }
}
