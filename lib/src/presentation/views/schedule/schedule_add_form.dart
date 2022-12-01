import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/core/util/formatter.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/horizontal_calendar/calendar.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class ScheduleAddForm extends StatefulWidget {
  static const String routeName = '/schedule/add';

  const ScheduleAddForm({Key? key}) : super(key: key);

  @override
  State<ScheduleAddForm> createState() => _ScheduleAddFormState();
}

class _ScheduleAddFormState extends State<ScheduleAddForm> {
  final rxSelectedDate = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Jadwal'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ValueListenableBuilder<DateTime>(
              valueListenable: rxSelectedDate,
              builder: (context, value, child) {
                return Text(kDateFullMonthFormat.format(value));
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder<DateTime>(
              valueListenable: rxSelectedDate,
              builder: (context, value, child) {
                return HorizontalCalendar(
                  date: value,
                  textColor: ThemeColors.blackPrimary,
                  backgroundColor: Colors.white,
                  onDateSelected: (date) {
                    rxSelectedDate.value = date;
                  },
                );
              },
            ),
            const SizedBox(height: 16),
            const FormTextLabel(label: 'Tipe Kegiatan'),
            const SizedBox(height: 4),
            FormzTextField(
              trailing: const Icon(Icons.keyboard_arrow_down),
              textEditingController: TextEditingController(
                text: 'Ganti Jadwal',
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
          child: const Text('TAMBAH'),
        ),
      ),
    );
  }
}
