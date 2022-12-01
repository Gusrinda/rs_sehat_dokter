import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/views/transaction/history_transaction_tile.dart';
import 'package:flutter/material.dart';

import 'chat_transaction_view.dart';

class HistoryTransactionView extends StatefulWidget {
  static const String routeName = '/transaction';

  const HistoryTransactionView({Key? key}) : super(key: key);

  @override
  State<HistoryTransactionView> createState() => _HistoryTransactionViewState();
}

class _HistoryTransactionViewState extends State<HistoryTransactionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Transaksi'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Text(kDateFullMonthFormat.format(DateTime.now())),
            HistoryTransactionTile(
              name: 'Alfiani Cantika',
              penyakit: 'Penyakit Ringan',
              status: 'Selesai',
              time: const TimeOfDay(hour: 16, minute: 0),
              onTap: onTap,
            ),
            HistoryTransactionTile(
              name: 'Siti Nur Baya',
              penyakit: 'Penyakit Ringan',
              status: 'Selesai',
              time: const TimeOfDay(hour: 16, minute: 0),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    Navigator.pushNamed(context, ChatTransactionView.routeName);
  }
}
