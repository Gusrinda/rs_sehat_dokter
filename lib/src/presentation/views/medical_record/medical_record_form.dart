import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../resep/resep_form_view.dart';

class MedicalRecordForm extends StatefulWidget {
  static const String routeName = '/medical-record/form';

  const MedicalRecordForm({Key? key}) : super(key: key);

  @override
  State<MedicalRecordForm> createState() => _MedicalRecordFormState();
}

class _MedicalRecordFormState extends State<MedicalRecordForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tulis Rekam Medik'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FormTextLabel(label: 'Nama Pasien'),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Alfiani Cantika',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: FormTextLabel(label: 'Tanggal'),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: FormTextLabel(label: 'No. Antrian'),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  flex: 2,
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
                    textEditingController: TextEditingController(text: '16'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Keluhan'),
            const SizedBox(height: 4),
            FormzTextField(
              textEditingController: TextEditingController(
                text: 'Nyeri kepala belakang setelah benturan kecelakaan',
              ),
              hintText: 'Keluhan',
              keyboardType: TextInputType.text,
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Diagnosa'),
            const SizedBox(height: 4),
            FormzTextField(
              textEditingController: TextEditingController(
                text:
                    'Keluhan cedera atau tramu pada kepala adalah penyebab benjolan di kepala yang paling umum terjadi hal ini terjadi akibat benturan keras di kepala seperti terjatuh, mengalami kecelakaan..',
              ),
              hintText: 'Diagnosa',
              keyboardType: TextInputType.text,
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Kesimpulan Tindakan'),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Rawat Jalan',
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Keterangan Tindakan'),
            const SizedBox(height: 4),
            FormzTextField(
              textEditingController: TextEditingController(
                text: 'Check up 2x seminggu',
              ),
              hintText: 'Keterangan Tindakan',
              keyboardType: TextInputType.text,
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Upload File Rekam Medik'),
            const SizedBox(height: 4),
            Container(
              height: 96,
              decoration: const BoxDecoration(
                color: ThemeColors.backgroundField,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: ThemeColors.backgroundFieldDark,
                ),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ResepFormView.routeName,
                  arguments: true,
                );
              },
              child: const Text('TULIS RESEP'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('SIMPAN'),
            ),
          ],
        ),
      ),
    );
  }
}
