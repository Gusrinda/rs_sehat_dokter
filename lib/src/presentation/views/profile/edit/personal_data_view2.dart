import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/views/profile/profile_view.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:dokter/src/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalDataView2 extends StatefulWidget {
  static const String routeName = '/profile/edit/2';

  const PersonalDataView2({super.key});

  @override
  State<PersonalDataView2> createState() => _PersonalDataView2State();
}

class _PersonalDataView2State extends State<PersonalDataView2> {
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
          const HeaderLabel('Akun'),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelEmailAddress,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormEmailAddressField(),
          const SizedBox(height: 16),
          FormTextLabel(
            label: AppLocalizations.of(context)!.labelPhone,
            mandatory: true,
          ),
          const SizedBox(height: 8),
          const _FormPhoneField(),
          const SizedBox(height: 16),
          SafeArea(
            minimum: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == ProfileView.routeName,
                );
              },
              child: Text(AppLocalizations.of(context)!.buttonSave),
            ),
          )
        ],
      ),
    );
  }
}

class _FormEmailAddressField extends StatelessWidget {
  const _FormEmailAddressField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController:
          TextEditingController(text: 'halimperdana@gmail.com'),
      hintText: AppLocalizations.of(context)!.labelEmailAddress,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _FormPhoneField extends StatelessWidget {
  const _FormPhoneField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      textEditingController: TextEditingController(text: '082237249720'),
      hintText: AppLocalizations.of(context)!.labelPhone,
      keyboardType: TextInputType.phone,
    );
  }
}


class _FormNewPasswordField extends StatelessWidget {
  const _FormNewPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormzTextField(
      trailing: GestureDetector(
        child: const Icon(Icons.visibility_outlined),
      ),
      hintText: '••••••••',
      obscureText: true,
    );
  }
}