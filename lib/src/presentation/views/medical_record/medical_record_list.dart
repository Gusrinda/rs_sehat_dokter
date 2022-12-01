import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/chip_widget.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:dokter/src/presentation/views/medical_record/medical_record_tile.dart';

import 'medical_record_detail_view.dart';
import 'medical_record_form.dart';

class MedicalRecordList extends StatefulWidget {
  static const String routeName = '/medical-record';

  const MedicalRecordList({Key? key}) : super(key: key);

  @override
  State<MedicalRecordList> createState() => _MedicalRecordListState();
}

class _MedicalRecordListState extends State<MedicalRecordList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MedicalRecordForm.routeName);
        },
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            const SearchFieldBar(hintText: 'Cari Pasien'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Text(
                  'Urut Berdasarkan',
                  style: TextStyle(fontSize: 10),
                ),
                FilterChips('A - Z'),
                FilterChips('Terbaru', selected: true),
              ],
            ),
            const SizedBox(height: 16),
            MedicalRecordTile(
              dokter: 'Alfiani Cantika - 689878',
              timestamp: DateTime(2022, 3, 18),
              onTap: () => handleDetail(context),
            ),
            MedicalRecordTile(
              dokter: 'Adi Himawan  - 689872',
              timestamp: DateTime(2022, 3, 14),
              onTap: () => handleDetail(context),
            ),
            MedicalRecordTile(
              dokter: 'Anita Salim - 689874',
              timestamp: DateTime(2022, 3, 8),
              onTap: () => handleDetail(context),
            ),
            MedicalRecordTile(
              dokter: 'Dewi Subahagia - 689875',
              timestamp: DateTime(2022, 3, 1),
              onTap: () => handleDetail(context),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Rekam Medik'),
    );
  }

  handleDetail(BuildContext context) {
    Navigator.pushNamed(context, MedicalRecordDetailView.routeName);
  }
}
