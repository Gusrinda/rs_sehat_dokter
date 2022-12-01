import 'package:dokter/src/core/assets/assets.gen.dart';
import 'package:dokter/src/presentation/base/base_rounded_top_body.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'change_password_view.dart';

class ForgotPasswordView extends StatefulWidget {
  static const String routeName = '/forgot-password/sent';

  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    String email = 'halimperdana@gmail.com';

    try {
      final split = email.split('@');
      if (split.length >= 2) {
        final domain = split.last;
        final username = split.first;
        final regex = RegExp(r'[a-zA-Z]');
        final maskedUsername =
            '${username[0]}${username.substring(1).replaceAll(regex, '*')}';
        email = '$maskedUsername@$domain';
      }
    } catch (_) {}

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleResetPassword),
      ),
      body: BaseRoundedTopBody(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Center(child: Assets.images.emailVerification.image(width: 144)),
            const SizedBox(height: 32),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .messageLinkResetPasswordSentBeforeEmail,
                  ),
                  TextSpan(
                    text: email,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)!
                        .messageLinkResetPasswordSentAfterEmail,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    ChangePasswordView.routeName,
                    (route) => false,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    AppLocalizations.of(context)!.buttonOpenEmail,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, kToolbarHeight),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: AppLocalizations.of(context)!.textNotReceivedEmail),
            TextSpan(
              text: AppLocalizations.of(context)!.linkButtonResend,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
          style: const TextStyle(fontSize: 15),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
