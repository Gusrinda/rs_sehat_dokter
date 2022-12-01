import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'schedule_edit_form.dart';
import 'schedule_tile.dart';

class ScheduleDetailView extends StatefulWidget {
  static const String routeName = '/schedule/detail';

  const ScheduleDetailView({Key? key}) : super(key: key);

  @override
  State<ScheduleDetailView> createState() => _ScheduleDetailViewState();
}

class _ScheduleDetailViewState extends State<ScheduleDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Jadwal'),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Assets.images.scheduleIllustrations.image(height: 150),
            const SizedBox(height: 32),
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
            const HeaderLabel('Pasien yang telah mengantri :'),
            const SizedBox(height: 8),
            const Text('''1. Indah Ayu
2. Putri Gilang
3. Giovana
4. Juang H
5. Supradi
6. Retno B'''),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, ScheduleEditForm.routeName);
          },
          child: const Text('UBAH'),
        ),
      ),
    );
  }
}
