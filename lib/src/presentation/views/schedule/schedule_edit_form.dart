import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'schedule_tile.dart';

class ScheduleEditForm extends StatefulWidget {
  static const String routeName = '/schedule/edit';

  const ScheduleEditForm({Key? key}) : super(key: key);

  @override
  State<ScheduleEditForm> createState() => _ScheduleEditFormState();
}

class _ScheduleEditFormState extends State<ScheduleEditForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Jadwal'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Jaga Poli',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Text('Selasa, 22 Maret 2022'),
            const SizedBox(height: 8),
            Timeline.tileBuilder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              theme: TimelineThemeData(
                nodePosition: 0.15,
                color: ThemeColors.grey4,
                indicatorTheme: const IndicatorThemeData(
                  position: 0.1,
                  size: 10.0,
                ),
                connectorTheme: const ConnectorThemeData(
                  thickness: 1.0,
                  space: 32,
                ),
              ),
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.basic,
                oppositeContentsBuilder: (context, index) =>
                    const ScheduleLeading(
                  start: TimeOfDay(hour: 8, minute: 0),
                  end: TimeOfDay(hour: 10, minute: 0),
                ),
                contentsBuilder: (context, index) => const ScheduleTile(
                  title: 'Jaga Poli',
                  description: '2 Pasien',
                ),
                indicatorStyle: IndicatorStyle.outlined,
                connectorStyle: ConnectorStyle.dashedLine,
                itemCount: 1,
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Tipe Perubahan'),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Ganti Jadwal',
              ),
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Ubah ke Tanggal'),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.calendar_month_outlined),
              textEditingController: TextEditingController(
                text: kDateShortMonthFormat.format(DateTime.now()),
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
                    trailing: const Icon(Icons.access_time),
                    textEditingController: TextEditingController(
                      text: kTimeFormat.format(DateTime.now()),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormzTextField(
                    trailing: const Icon(Icons.access_time),
                    textEditingController: TextEditingController(
                      text: kTimeFormat.format(DateTime.now()),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Alasan'),
            const SizedBox(height: 4),
            FormzTextField(
              textEditingController: TextEditingController(
                text: 'Rencana pergi ke bank',
              ),
              hintText: 'Alasan',
              keyboardType: TextInputType.text,
              maxLines: 5,
              minLines: 3,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('PERBARUI'),
        ),
      ),
    );
  }
}
