import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';

class HeaderLabel extends StatelessWidget {
  const HeaderLabel(this.label, {super.key, this.readMore});

  final String label;
  final VoidCallback? readMore;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );

    if (readMore != null) {
      return Row(
        children: [
          text,
          const Spacer(),
          GestureDetector(
            onTap: readMore,
            child: const Text(
              'Lihat Semua',
              style: TextStyle(fontSize: 10),
            ),
          ),
        ],
      );
    }

    return text;
  }
}

class SubHeaderLabel extends StatelessWidget {
  const SubHeaderLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        color: ThemeColors.greyCaption,
      ),
    );
  }
}

class TitleLabel extends StatelessWidget {
  const TitleLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
