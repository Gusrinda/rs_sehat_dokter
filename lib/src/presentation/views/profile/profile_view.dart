import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:dokter/src/presentation/widgets/chip_widget.dart';
import 'package:dokter/src/presentation/widgets/label_value_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'edit/personal_data_view.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('halimperdana'),
      ),
      body: const _ContentView(),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, PersonalDataView.routeName);
          },
          child: const Text('UBAH'),
        ),
      ),
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
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'dr. Halim Perdana, Sp.PD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Spesialis Penyakit Dalam',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white54,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'NIP 198007272008121003',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      ColorChip('Dokter', color: Colors.white24),
                    ],
                  ),
                ),
                Assets.images.doctorAvatar.image(width: 90),
                const SizedBox(width: 16),
              ],
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
              children: const [
                HeaderLabel('Data Diri'),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Nama Lengkap',
                  value: 'Halim Perdana',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Gelar Depan',
                  value: 'dr',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Gelar Belakang',
                  value: 'Sp.PD',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Tempat Tanggal Lahir',
                  value: 'Senin, 20 Juli 1990',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Alamat',
                  value:
                      'Jl. Adi Sucipto No.9, Tukangkayu, Kec. Banyuwangi, Kabupaten Banyuwangi, Jawa Timur 68411',
                ),
                SizedBox(height: 32),
                HeaderLabel('Akun'),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Email',
                  value: 'halimperdana@gmail.com',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'No. Telepon',
                  value: '082237249720',
                ),
                SizedBox(height: 16),
                LabelValueVertical(
                  label: 'Status Akun',
                  value: 'Aktif',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
