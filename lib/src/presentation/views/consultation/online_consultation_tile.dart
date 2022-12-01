import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/core/util/extension.dart';
import 'package:flutter/material.dart';

class OnlineConsultationTile extends StatelessWidget {
  const OnlineConsultationTile({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.lastTimestamp,
    this.isNew = false,
    this.isSessionActive = false,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String lastMessage;
  final TimeOfDay lastTimestamp;
  final bool isNew;
  final bool isSessionActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget leading = const Icon(
      Icons.account_circle_outlined,
      size: 48,
      color: ThemeColors.grey5,
    );
    if (isSessionActive) {
      leading = Stack(
        children: [
          leading,
          Positioned(
            right: 4,
            bottom: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              height: 12,
              width: 12,
            ),
          )
        ],
      );
    }

    final title = Text(
      name,
      style: TextStyle(
        fontSize: 18,
        color: Theme.of(context).primaryColor,
      ),
    );
    final subtitle = Text(
      lastMessage,
      style: TextStyle(
        fontWeight:
            isSessionActive && isNew ? FontWeight.bold : FontWeight.normal,
        color: isSessionActive || isNew ? Colors.black : null,
        fontSize: 13,
        fontStyle: isSessionActive ? FontStyle.normal : FontStyle.italic,
      ),
    );
    final trailing = Text(
      lastTimestamp.description,
      style: TextStyle(
        fontSize: 13,
        color: isNew ? Colors.black : ThemeColors.greyCaption,
      ),
    );

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
