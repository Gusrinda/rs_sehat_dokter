import 'package:dokter/src/core/util/extension.dart';
import 'package:flutter/material.dart';

class ScheduleLeading extends StatelessWidget {
  const ScheduleLeading({
    Key? key,
    required this.start,
    this.end,
    this.color,
  }) : super(key: key);

  final TimeOfDay start;
  final TimeOfDay? end;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(start.description, style: const TextStyle(fontSize: 13)),
        if (end != null)
          Text(end!.description, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}

class ScheduleTile extends StatelessWidget {
  const ScheduleTile({
    Key? key,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontSize: 15)),
      subtitle: Text(description, style: const TextStyle(fontSize: 13)),
      trailing: onTap == null ? null : const Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}
