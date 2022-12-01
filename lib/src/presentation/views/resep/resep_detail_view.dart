import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/views/resep/resep_widget.dart';
import 'package:dokter/src/presentation/widgets/label_value_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';

import '../consultation/chat_detail_view.dart';

class ResepDetailView extends StatefulWidget {
  static const String routeName = '/resep/detail';

  const ResepDetailView({Key? key, this.pop = false}) : super(key: key);

  final bool pop;

  @override
  State<ResepDetailView> createState() => _ResepDetailViewState();
}

class _ResepDetailViewState extends State<ResepDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Resep'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const HeaderLabel('Alfiani Cantika'),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Tanggal Konsultasi',
              value: 'Jum’at, 18 Maret 2022',
            ),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Dokter',
              value: 'dr. Halim Perdana, Sp.PD',
            ),
            const SizedBox(height: 16),
            const HeaderLabel('Detail Obat'),
            const SizedBox(height: 16),
            const ResepTileCheckBox(
              selected: null,
              title: 'Aspirin 50mg',
              qty: 2,
              price: 12500,
              description: 'Minum sebelum makan',
            ),
            const ResepTileCheckBox(
              selected: null,
              title: 'Ibuprofen',
              qty: 2,
              price: 25000,
              description: 'Minum sesudah makan',
            ),
            const Divider(color: Colors.grey),
            Row(
              children: [
                const Text('Total'),
                const Spacer(),
                Text(
                  kRupiahFormat.format(75000),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: () {
            if (widget.pop) {
              Navigator.pop(context);
            } else {
              Navigator.popUntil(
                context,
                (route) =>
                    route.settings.name == ConsultationDetailView.routeName,
              );
            }
          },
          child: widget.pop
              ? const Text('KEMBALI')
              : const Text('KEMBALI KE KONSULTASI'),
        ),
      ),
    );
  }
}
