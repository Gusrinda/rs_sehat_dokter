import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';

class LabelValueVertical extends StatelessWidget {
  const LabelValueVertical({
    Key? key,
    required this.label,
    required this.value,
    this.trailing,
  }) : super(key: key);

  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final valueText = Text(value, style: const TextStyle(fontSize: 14));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: ThemeColors.greyCaption,
          ),
        ),
        trailing != null
            ? Row(children: [Expanded(child: valueText), trailing!])
            : valueText,
      ],
    );
  }
}

class LabelValueVertical2 extends StatelessWidget {
  const LabelValueVertical2({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
