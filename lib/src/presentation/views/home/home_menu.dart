import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:flutter/material.dart';

import '../consultation/online_consultation_view.dart';
import '../medical_record/medical_record_list.dart';
import '../queue/queue_list_view.dart';
import '../schedule/schedule_listview.dart';
import '../transaction/history_transaction_view.dart';

class HomeMenuGridView extends StatelessWidget {
  const HomeMenuGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final kListMenu = [
      HomeMenu(
        image: Assets.icons.home.daftarAntrian.path,
        label: 'Daftar Antrian',
        onTap: () {
          Navigator.pushNamed(context, QueueListView.routeName);
        },
      ),
      HomeMenu(
        image: Assets.icons.home.rekamMedik.path,
        label: 'Rekam Medik',
        onTap: () {
          Navigator.pushNamed(context, MedicalRecordList.routeName);
        },
      ),
      HomeMenu(
        image: Assets.icons.home.jadwalDokter.path,
        label: 'Jadwal Dokter',
        onTap: () {
          Navigator.pushNamed(context, ScheduleListView.routeName);
        },
      ),
      HomeMenu(
        image: Assets.icons.home.konsultasi.path,
        label: 'Konsultasi',
        onTap: () {
          Navigator.pushNamed(context, OnlineConsultationView.routeName);
        },
      ),
      HomeMenu(
        image: Assets.icons.home.transaksi.path,
        label: 'Transaksi',
        onTap: () {
          Navigator.pushNamed(context, HistoryTransactionView.routeName);
        },
      ),
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;
        const paddingWidth = 20 * 2;
        const cellSpace = 8 * 4;
        final cellSize = (maxWidth - paddingWidth - cellSpace) / 5;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8,
            mainAxisExtent: cellSize + 48.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return kListMenu[index];
          },
          itemCount: kListMenu.length,
        );
      },
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
    required this.label,
    required this.image,
    required this.onTap,
  });

  final String label;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 10,
                    color: Color(0x4066D066),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(image, width: 40, height: 40),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
