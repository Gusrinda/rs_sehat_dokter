import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:flutter/material.dart';

import 'queue_tile.dart';

class QueueListView extends StatefulWidget {
  static const String routeName = '/queue';

  const QueueListView({Key? key}) : super(key: key);

  @override
  State<QueueListView> createState() => _QueueListViewState();
}

class _QueueListViewState extends State<QueueListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Antrian'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text(kDateFullMonthFormat.format(DateTime.now())),
            QueueTile(
              name: 'Juang Sabillah',
              norm: '68987',
              username: 'juangsabillah',
              queue: '018',
              onTap: onTap,
            ),
            QueueTile(
              name: 'Hilman Hasbi',
              norm: '68985',
              username: 'hilmanhasbi',
              queue: '017',
              onTap: onTap,
            ),
            QueueTile(
              name: 'Alfiani Cantika',
              norm: '68989',
              username: 'alfianicantika',
              queue: '016',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    // Navigator.pushNamed(context, ChatTransactionView.routeName);
  }
}
