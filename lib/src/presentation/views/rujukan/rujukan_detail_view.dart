import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/widgets/chip_widget.dart';
import 'package:dokter/src/presentation/widgets/label_value_widget.dart';

import '../consultation/chat_detail_view.dart';

class RujukanDetailView extends StatefulWidget {
  static const String routeName = '/rujukan/detail';

  const RujukanDetailView({Key? key}) : super(key: key);

  @override
  State<RujukanDetailView> createState() => _RujukanDetailViewState();
}

class _RujukanDetailViewState extends State<RujukanDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LabelValueVertical(
              label: 'Fasilitas Kesehatan',
              value: 'Rumah Sakit Yasmin Banyuwangi',
            ),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Dokter',
              value: 'dr. Halim Perdana, Sp.PD',
            ),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Tanggal',
              value: '9 Maret 2022 - 12 Maret 2022',
            ),
            const SizedBox(height: 16),
            const Text(
              'Status',
              style: TextStyle(
                fontSize: 12,
                color: ThemeColors.greyCaption,
              ),
            ),
            const SizedBox(height: 4),
            Row(children: const [ActiveInActiveChip(active: true)]),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Fasilitas kesehatan yang dirujuk',
              value: 'RSUD Blambangan',
            ),
            const SizedBox(height: 16),
            const Text(
              'Jl. Letkol Istiqlah No.80-84, Singonegaran, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68415',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ThemeColors.greyCaption,
              ),
            ),
            const Text(
              'Telp. 0333421118',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ThemeColors.greyCaption,
              ),
            ),
            const SizedBox(height: 16),
            const LabelValueVertical(
              label: 'Poli',
              value: 'Spesialis Penyakit Dalam',
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(
              context,
              (route) => route.settings.name == ConsultationDetailView.routeName,
            );
          },
          child: const Text('KEMBALI KE KONSULTASI'),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Detail Rujukan'),
    );
  }
}
