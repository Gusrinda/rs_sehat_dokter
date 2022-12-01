import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dokter/src/core/config/theme_colors.dart';

import '../resep/resep_form_view.dart';
import '../rujukan/rujukan_form_view.dart';
import 'chat_bubble.dart';

class ConsultationDetailView extends StatefulWidget {
  static const String routeName = '/consultation/detail';

  const ConsultationDetailView({Key? key}) : super(key: key);

  @override
  State<ConsultationDetailView> createState() => _ConsultationDetailViewState();
}

class _ConsultationDetailViewState extends State<ConsultationDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroundPage,
      appBar: AppBar(
        title: const Text('Alfiani Cantika'),
        actions: [
          PopupMenuButton<VoidCallback>(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: () => Navigator.pushNamed(
                    context,
                    ResepFormView.routeName,
                  ),
                  child: const Text('Tulis Resep'),
                ),
                PopupMenuItem(
                  value: () => Navigator.pushNamed(
                    context,
                    RujukanFormView.routeName,
                  ),
                  child: const Text('Tulis Rujukan'),
                ),
                PopupMenuItem(
                  value: () => Navigator.pop(context),
                  child: const Text('Akhiri Konsultasi'),
                ),
              ];
            },
            onSelected: (fn) => fn(),
          ),
        ],
      ),
      body: ListView(
        reverse: true,
        children: const [
          ChatBubble(
            message:
                'Ini resep obat yang perlu Anda tebus Aspirin 50mg 2x1, Ibuprofen 3x1. Untuk detailnya bisa Anda kunjungi di link berikut link.tree/resepObat',
            time: TimeOfDay(hour: 9, minute: 25),
            me: true,
          ),
          ChatBubble(
            message: 'Baik terima kasih atas waktunya, Dok...',
            time: TimeOfDay(hour: 9, minute: 24),
          ),
          ChatBubble(
            message:
                'jika benjolan tidak membaik dalam beberapa hari setidaknya dalam 7 hari atau semakin membesar, nyeri yang hebat, meyebabkan hilangnya kesadaran maka segera menemui dokter untuk mendapatkan pemeriksaan dan penangnan lebih lanjut. \n\nsemoga dapat membantu',
            time: TimeOfDay(hour: 9, minute: 23),
            me: true,
          ),
          ChatBubble(
            message:
                'Alo, selamat sore \n\nkeluhan cedera atau tramu pada kepala adalah penyebab benjolan di kepala yang paling umum terjadi hal ini terjadi akibat benturan keras di kepala seperti terjatuh, mengalami kecelakaan atau kekerasan fisik. umumnya seseorang terbentur dan mengalami cedera kepala benjolan akan muncul sebagai respon alami tubuh akibat darah merembes dari pembuluh kapiler yang pecah di bawah kulit. hal ini menimbulkan terjadi peradangn sehingga dapat menyebabkan keluhan nyeri umumnya kondisi ini meurpakan cedera kepala ringan benjolan akan kempes dalam beberapa hari anda bisa melakukan kompres hangat pada bagian benjolan kepala selama 15-20 menit anda bisa ulangi setidaknya 2-3 kali sehari.',
            time: TimeOfDay(hour: 9, minute: 22),
            me: true,
          ),
          ChatBubble(
            message:
                'Alodok.. Tgl 14 kmaren saya kecelakaan dan entah terjadi benturan bagaimana.. Kepala belakang saya ada benjolan.. Sempat pingsan tapi cuma sebentar.. Nah setelah itu saya langsung di bawa ke RS.. Tp dokter bilang itu benjolan biasa tidak knapa".. Tidak ada muntah".. Saya d kasi obat ibuprofen setelah itu d bolehkan pulang.. Sampe skarang ndak ada muntah" ataupun sampai ndak sadarkan diri.. Cuma kalau di pegang masih sakit.. Itu ndak papa kah dok? Terimakasih',
            time: TimeOfDay(hour: 9, minute: 21),
          ),
          ChatBubble(
            message: 'Selamat sore, apa yang bisa saya bantu?',
            time: TimeOfDay(hour: 9, minute: 20),
            me: true,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: ThemeColors.grey7,
        child: SafeArea(
          minimum: EdgeInsets.fromLTRB(
            16,
            8,
            16,
            max(8, MediaQuery.of(context).viewInsets.bottom + 8),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              fillColor: Colors.white,
              filled: true,
              suffixIcon: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, ResepView.routeName);
                },
                child: const Icon(Icons.chevron_right),
              ),
              hintText: 'Ketik pesan...',
              contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
            ),
          ),
        ),
      ),
    );
  }
}
