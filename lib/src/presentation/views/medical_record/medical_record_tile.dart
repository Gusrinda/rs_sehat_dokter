import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/core/util/formatter.dart';

class MedicalRecordTile extends StatelessWidget {
  const MedicalRecordTile({
    Key? key,
    required this.dokter,
    required this.timestamp,
    this.color,
    required this.onTap,
  }) : super(key: key);

  final String dokter;
  final DateTime timestamp;
  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).primaryColor;

    final container = Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0),
          color.withOpacity(0.3),
        ]),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Container(height: 49, width: 2, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  dokter,
                  style: TextStyle(color: color, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.calendar_month_outlined,
                          size: 14,
                          color: ThemeColors.greyCaption,
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      const TextSpan(text: '  '),
                      TextSpan(text: kDayFullDate2Format.format(timestamp)),
                    ],
                  ),
                  style: const TextStyle(
                    fontSize: 11,
                    color: ThemeColors.greyCaption,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: ThemeColors.green),
        ],
      ),
    );

    return GestureDetector(onTap: onTap, child: container);
  }
}
