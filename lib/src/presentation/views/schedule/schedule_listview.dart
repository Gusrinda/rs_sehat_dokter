import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/views/schedule/schedule_tile.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'schedule_add_form.dart';
import 'schedule_detail_view.dart';

class ScheduleListView extends StatefulWidget {
  static const String routeName = '/schedule';

  const ScheduleListView({Key? key}) : super(key: key);

  @override
  State<ScheduleListView> createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Praktek'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ScheduleAddForm.routeName);
        },
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CalendarDatePicker(
                initialDate: today,
                firstDate: today,
                lastDate: DateTime(2037),
                onDateChanged: (DateTime value) async {},
              ),
            ),
            const SizedBox(height: 16),
            const HeaderLabel('Hari ini'),
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
                    scheduleLeadingList[index],
                contentsBuilder: (context, index) => scheduleContentList[index],
                indicatorStyle: IndicatorStyle.outlined,
                connectorStyle: ConnectorStyle.dashedLine,
                itemCount: scheduleLeadingList.length,
              ),
            ),
            const SizedBox(height: 16),
            const HeaderLabel('23 Maret 2022'),
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
                contentsBuilder: (context, index) => ScheduleTile(
                  title: 'Jaga Poli',
                  description: '2 Pasien',
                  onTap: () {},
                ),
                indicatorStyle: IndicatorStyle.outlined,
                connectorStyle: ConnectorStyle.dashedLine,
                itemCount: 1,
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  List<Widget> get scheduleLeadingList {
    return [
      const ScheduleLeading(
        start: TimeOfDay(hour: 8, minute: 0),
        end: TimeOfDay(hour: 10, minute: 0),
      ),
      const ScheduleLeading(
        start: TimeOfDay(hour: 14, minute: 0),
        end: TimeOfDay(hour: 15, minute: 0),
      ),
      const ScheduleLeading(
        start: TimeOfDay(hour: 17, minute: 0),
        end: TimeOfDay(hour: 19, minute: 0),
      ),
    ];
  }

  List<Widget> get scheduleContentList {
    return [
      ScheduleTile(
        title: 'Jaga Poli',
        description: '5 Pasien',
        onTap: handleDetail,
      ),
      ScheduleTile(
        title: 'Meeting Evaluasi',
        description: 'Evaluasi rutin bulanan',
        onTap: () {},
      ),
      ScheduleTile(
        title: 'Jaga Poli',
        description: '6 Pasien',
        onTap: () {},
      ),
    ];
  }

  void handleDetail() {
    Navigator.pushNamed(context, ScheduleDetailView.routeName);
  }
}
