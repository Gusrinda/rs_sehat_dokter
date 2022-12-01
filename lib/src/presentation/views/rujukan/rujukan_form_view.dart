import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/core/util/formatter.dart';

import 'rujukan_detail_view.dart';

class RujukanFormView extends StatefulWidget {
  static const String routeName = '/rujukan/new';

  const RujukanFormView({Key? key}) : super(key: key);

  @override
  State<RujukanFormView> createState() => _RujukanFormViewState();
}

class _RujukanFormViewState extends State<RujukanFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tulis Rujukan'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const FormTextLabel(
                label: 'Fasilitas Kesehatan Asal', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Rumah Sakit Yasmin Banyuwangi',
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Dokter', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'dr. Halim Perdana, Sp.PD',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: FormTextLabel(label: 'Mulai', mandatory: true),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: FormTextLabel(label: 'Berakhir', mandatory: true),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: FormzTextField(
                    trailing: const Icon(Icons.calendar_month_outlined),
                    textEditingController: TextEditingController(
                      text: kDateShortMonthFormat.format(DateTime.now()),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormzTextField(
                    trailing: const Icon(Icons.calendar_month_outlined),
                    textEditingController: TextEditingController(
                      text: kDateShortMonthFormat.format(DateTime.now()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const FormTextLabel(
                label: 'Fasilitas Kesehatan Rujukan', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'RSUD Blambangan',
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Poli', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Spesialis Penyakit Dalam',
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              RujukanDetailView.routeName,
            );
          },
          child: const Text('BUAT RUJUKAN'),
        ),
      ),
    );
  }
}
