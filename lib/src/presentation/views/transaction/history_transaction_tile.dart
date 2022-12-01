import 'package:dokter/src/core/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/widgets/chip_widget.dart';

class HistoryTransactionTile extends StatelessWidget {
  const HistoryTransactionTile({
    Key? key,
    required this.name,
    required this.penyakit,
    required this.status,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String penyakit;
  final String status;
  final TimeOfDay time;
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
            Icons.account_circle_outlined,
            size: 48,
            color: ThemeColors.grey5,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  penyakit,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GreyChip(status),
              const SizedBox(height: 8),
              Text(
                time.description,
                style: const TextStyle(
                  fontSize: 11,
                  color: ThemeColors.greyCaption,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return GestureDetector(onTap: onTap, child: container);
  }
}
