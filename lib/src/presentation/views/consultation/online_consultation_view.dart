import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:flutter/material.dart';

import 'chat_detail_view.dart';
import 'online_consultation_tile.dart';

class OnlineConsultationView extends StatefulWidget {
  static const String routeName = '/consultation';

  const OnlineConsultationView({Key? key}) : super(key: key);

  @override
  State<OnlineConsultationView> createState() => _OnlineConsultationViewState();
}

class _OnlineConsultationViewState extends State<OnlineConsultationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi Online'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OnlineConsultationTile(
              name: 'Adi Himawan',
              lastMessage: 'Selamat siang, Dok saya kemarin ..',
              lastTimestamp: const TimeOfDay(hour: 16, minute: 00),
              isSessionActive: true,
              onTap: () => handleDetail(context),
            ),
            OnlineConsultationTile(
              name: 'Alfian Cantika',
              lastMessage: 'Hi Dok, saya mau konsultasi. Akhir..',
              lastTimestamp: const TimeOfDay(hour: 15, minute: 45),
              isSessionActive: true,
              isNew: true,
              onTap: () => handleDetail(context),
            ),
            OnlineConsultationTile(
              name: 'Anita Salim',
              lastMessage: 'Sesi telah berakhir',
              lastTimestamp: const TimeOfDay(hour: 15, minute: 31),
              onTap: () => handleDetail(context),
            ),
            OnlineConsultationTile(
              name: 'Dewi Subahagia',
              lastMessage: 'Terima kasih Dok',
              lastTimestamp: const TimeOfDay(hour: 15, minute: 02),
              isSessionActive: true,
              onTap: () => handleDetail(context),
            ),
          ],
        ),
      ),
    );
  }

  handleDetail(BuildContext context) {
    Navigator.pushNamed(context, ConsultationDetailView.routeName);
  }
}
