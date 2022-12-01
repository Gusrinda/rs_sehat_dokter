import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'personal_data_view2.dart';

class PersonalDataView extends StatefulWidget {
  static const String routeName = '/profile/edit';

  const PersonalDataView({super.key});

  @override
  State<PersonalDataView> createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const _ContentView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Ubah Data Diri'),
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseRoundedTopBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderLabel('Data Diri'),
          const SizedBox(height: 16),
          const FormTextLabel(
            label: 'Nama Lengkap',
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormFullNameField(),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: FormTextLabel(label: 'Gelar Depan', mandatory: true),
              ),
              SizedBox(width: 16),
              Expanded(
                child: FormTextLabel(label: 'Gelar Belakang', mandatory: true),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Expanded(child: _FormGelarDepanField()),
              SizedBox(width: 16),
              Expanded(child: _FormGelarBelakangField()),
            ],
          ),
          const SizedBox(height: 16),
          const FormTextLabel(
            label: 'Instalasi',
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormInstalasiField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelNIK,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormNIKField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelDateOfBirth,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormDateOfBirthField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelProvince,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormProvinceField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelCity,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormCityField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelDistrict,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormDistrictField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelVillage,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormVillageField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelAddress,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormAddressField(),
          const SizedBox(height: 16),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PersonalDataView2.routeName);
              },
              child: Text(AppLocalizations.of(context)!.buttonNext),
            ),
          )
        ],
      ),
    );
  }
}

class _FormJabatanField extends StatelessWidget {
  const _FormJabatanField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Dokter'),
      enabled: false,
      hintText: 'Jabatan',
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class _FormFullNameField extends StatelessWidget {
  const _FormFullNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Halim Perdana'),
      hintText: 'Nama Lengkap',
      keyboardType: TextInputType.name,
    );
  }
}

class _FormGelarDepanField extends StatelessWidget {
  const _FormGelarDepanField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'dr'),
      hintText: 'Gelar Depan',
      keyboardType: TextInputType.text,
    );
  }
}

class _FormGelarBelakangField extends StatelessWidget {
  const _FormGelarBelakangField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'sp.PD'),
      hintText: 'Gelar Belakang',
      keyboardType: TextInputType.text,
    );
  }
}

class _FormInstalasiField extends StatelessWidget {
  const _FormInstalasiField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(
        text: 'Spesialis Penyakit Dalam',
      ),
      hintText: 'Instalasi',
      readOnly: true,
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class _FormNIPField extends StatelessWidget {
  const _FormNIPField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: '198007272008121003'),
      hintText: 'NIP',
    );
  }
}

class _FormNIKField extends StatelessWidget {
  const _FormNIKField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: '35251552007900001'),
      hintText: AppLocalizations.of(context)!.labelNIK,
    );
  }
}

class _FormDateOfBirthField extends StatelessWidget {
  const _FormDateOfBirthField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: '22 Maret 1990'),
      hintText: AppLocalizations.of(context)!.labelPlaceOfBirth,
      readOnly: true,
      trailing: const Icon(Icons.calendar_month_outlined),
    );
  }
}

class _FormAddressField extends StatelessWidget {
  const _FormAddressField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(
        text: 'Jl. Adi Sucipto No.9',
      ),
      hintText: AppLocalizations.of(context)!.labelAddress,
      keyboardType: TextInputType.streetAddress,
      maxLines: 5,
      minLines: 3,
    );
  }
}

class _FormProvinceField extends StatelessWidget {
  const _FormProvinceField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Jawa Timur'),
      hintText: AppLocalizations.of(context)!.labelProvince,
      readOnly: true,
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class _FormCityField extends StatelessWidget {
  const _FormCityField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Banyuwangi'),
      hintText: AppLocalizations.of(context)!.labelCity,
      readOnly: true,
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class _FormDistrictField extends StatelessWidget {
  const _FormDistrictField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Kec. Gubeng'),
      hintText: AppLocalizations.of(context)!.labelDistrict,
      readOnly: true,
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}

class _FormVillageField extends StatelessWidget {
  const _FormVillageField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: 'Tukang Kayu'),
      hintText: AppLocalizations.of(context)!.labelVillage,
      readOnly: true,
      trailing: const Icon(Icons.keyboard_arrow_down),
    );
  }
}
