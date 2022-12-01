import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/views/auth/change_password_view.dart';
import 'package:dokter/src/presentation/views/auth/login_view.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../profile/profile_view.dart';
import '../schedule/schedule_tile.dart';
import 'home_menu.dart';
import 'home_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const _ContentView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Container(
        padding: const EdgeInsets.all(16),
        child: Assets.logo.logoWhite.image(height: 32),
      ),
      title: const Text('dr. Halim Perdana, Sp.PD'),
      actions: [
        PopupMenuButton<VoidCallback>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: () =>
                    Navigator.pushNamed(context, ProfileView.routeName),
                child: const Text('Data Diri'),
              ),
              PopupMenuItem(
                value: () => Navigator.pushNamed(
                  context,
                  ChangePasswordView.routeName,
                ),
                child: const Text('Ubah Password'),
              ),
              PopupMenuItem(
                value: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginView.routeName,
                  (route) => false,
                ),
                child: const Text('Keluar'),
              ),
            ];
          },
          child: const Icon(
            Icons.account_circle_outlined,
            size: 28,
          ),
          onSelected: (fn) => fn(),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSuper(
        innerDistance: -16,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            color: Theme.of(context).primaryColor,
            child: const SearchFieldBar(
              hintText: 'Pencarian',
              trailing: null,
              leading: Icon(Icons.search),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderLabel('Kategori'),
                const SizedBox(height: 16),
                const HomeMenuGridView(),
                const SizedBox(height: 24),
                const OnlineAppointmentsCard(),
                const SizedBox(height: 24),
                const HeaderLabel('Pengumuman Hari Ini'),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: ThemeColors.backgroundField),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Timeline.tileBuilder(
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
                      ),
                      contentsBuilder: (context, index) => ScheduleTile(
                        title: 'Meeting Evaluasi Pelayanan',
                        description: 'Ruangan Meeting',
                        onTap: () {},
                      ),
                      indicatorStyle: IndicatorStyle.outlined,
                      connectorStyle: ConnectorStyle.dashedLine,
                      itemCount: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
