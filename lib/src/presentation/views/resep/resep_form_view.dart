import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/views/resep/resep_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';

import 'resep_detail_view.dart';

class ResepFormView extends StatefulWidget {
  static const String routeName = '/resep/new';

  const ResepFormView({Key? key, this.pop = false}) : super(key: key);

  final bool pop;

  @override
  State<ResepFormView> createState() => _ResepFormViewState();
}

class _ResepFormViewState extends State<ResepFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tulis Resep'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Tanggal', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.calendar_month_outlined),
              textEditingController: TextEditingController(
                text: kDayFullDate2Format.format(DateTime.now()),
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Obat', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Aspirin 50mg',
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Jumlah', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: '2 Strip',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  flex: 4,
                  child: FormTextLabel(label: 'Perhari', mandatory: true),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: FormTextLabel(label: 'Satuan', mandatory: true),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: FormzTextField(
                          textEditingController:
                              TextEditingController(text: '2'),
                        ),
                      ),
                      const Text('   X   '),
                      Expanded(
                        child: FormzTextField(
                          textEditingController:
                              TextEditingController(text: '1'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: FormzTextField(
                    trailing: const Icon(Icons.keyboard_arrow_down),
                    textEditingController: TextEditingController(
                      text: 'Tablet',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Keterangan', mandatory: true),
            const SizedBox(height: 4),
            FormzTextField(
              textEditingController: TextEditingController(
                text: 'Minum sebelum makan',
              ),
              hintText: 'Keterangan',
              keyboardType: TextInputType.streetAddress,
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 4),
            OutlinedButton(
              onPressed: () {},
              child: const Text('TAMBAH OBAT'),
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
            Navigator.pushNamed(
              context,
              ResepDetailView.routeName,
              arguments: widget.pop
            );
          },
          child: const Text('BUAT RESEP'),
        ),
      ),
    );
  }
}
