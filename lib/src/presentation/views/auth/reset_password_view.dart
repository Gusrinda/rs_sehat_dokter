import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatefulWidget {
  static const String routeName = '/forgot-passsword';

  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final controller = TextEditingController(text: 'halimperdana@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleResetPassword),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            subtitle,
            const SizedBox(height: 16),
            FormTextLabel(
              label: AppLocalizations.of(context)!.labelEmailAddress,
            ),
            const SizedBox(height: 8),
            _FormEmailField(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, controller.text);
          },
          child: Text(AppLocalizations.of(context)!.buttonSend),
        ),
      ),
    );
  }

  Text get subtitle {
    return Text(
      AppLocalizations.of(context)!.messageResetPassword,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    );
  }
}

class _FormEmailField extends StatelessWidget {
  const _FormEmailField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: FormzTextField(
        textEditingController: controller,
        trailing: const Icon(Icons.email_outlined),
        hintText: 'akun@email.com',
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
