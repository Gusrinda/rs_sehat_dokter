import 'package:dokter/src/presentation/base/base_material_page.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_view.dart';

class ChangePasswordView extends StatefulWidget {
  static const String routeName = '/change-password';

  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return BaseMaterialPage(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.titleChangePassword),
        ),
        body: BaseRoundedTopBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.messageChangePassword,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 16),
              FormTextLabel(
                label: AppLocalizations.of(context)!.labelPassword,
                mandatory: true,
              ),
              const SizedBox(height: 8),
              const _FormPasswordField(),
              const SizedBox(height: 16),
              FormTextLabel(
                label: AppLocalizations.of(context)!.labelPasswordConfirmation,
                mandatory: true,
              ),
              const SizedBox(height: 8),
              const _FormPasswordConfirmationField(),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeView.routeName,
                (route) => false,
              );
            },
            child: Text(AppLocalizations.of(context)!.buttonResetPassword),
          ),
        ),
      ),
    );
  }
}

class _FormPasswordConfirmationField extends StatelessWidget {
  const _FormPasswordConfirmationField({
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

class _FormPasswordField extends StatelessWidget {
  const _FormPasswordField({
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
