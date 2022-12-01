import 'package:dokter/src/core/config/theme_colors.dart';
import 'package:dokter/src/presentation/base/base_material_page.dart';
import 'package:dokter/src/presentation/blocs/auth/login/login_bloc.dart';
import 'package:dokter/src/presentation/widgets/hero_widget.dart';
import 'package:dokter/src/presentation/widgets/logo_widget.dart';
import 'package:dokter/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_view.dart';
import 'forgot_password_view.dart';
import 'reset_password_view.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMaterialPage(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GreenLogo(),
              const SizedBox(height: 64),
              Hero(
                tag: 'Label-Username',
                flightShuttleBuilder: flightShuttleBuilder,
                child: FormTextLabel(
                  label: AppLocalizations.of(context)!.labelUsername,
                ),
              ),
              const SizedBox(height: 8),
              const _FormUsernameField(),
              const SizedBox(height: 16),
              Hero(
                tag: 'Label-Password',
                flightShuttleBuilder: flightShuttleBuilder,
                child: FormTextLabel(
                  label: AppLocalizations.of(context)!.labelPassword,
                ),
              ),
              const SizedBox(height: 8),
              const _FormPasswordField(),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => handleResetPassword(context),
                    child: Text(
                      AppLocalizations.of(context)!.linkButtonForgotPassword,
                      style: const TextStyle(
                        fontSize: 15,
                        color: ThemeColors.greyCaption,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Hero(
                tag: 'Form-Button',
                flightShuttleBuilder: flightShuttleBuilder,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeView.routeName,
                      (route) => false,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.buttonLogin,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Future<void> handleResetPassword(BuildContext context) async {
    final navigator = Navigator.of(context);
    final email = await navigator.pushNamed(ResetPasswordView.routeName);

    if (email is String) {
      navigator.pushNamed(ForgotPasswordView.routeName, arguments: email);
    }
  }
}

class _FormPasswordField extends StatelessWidget {
  const _FormPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.fieldPassword != current.fieldPassword ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return Hero(
          tag: 'Form-Password',
          flightShuttleBuilder: flightShuttleBuilder,
          child: Material(
            color: Colors.transparent,
            child: FormzTextField(
              trailing: GestureDetector(
                child: state.obscurePassword
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                onTap: () => context
                    .read<LoginBloc>()
                    .add(TogglePasswordObscured(!state.obscurePassword)),
              ),
              hintText: '••••••••',
              obscureText: state.obscurePassword,
              textInputAction: TextInputAction.done,
              onChanged: (password) =>
                  context.read<LoginBloc>().add(OnPasswordChanged(password)),
            ),
          ),
        );
      },
    );
  }
}

class _FormUsernameField extends StatelessWidget {
  const _FormUsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.fieldUsername != current.fieldUsername,
      builder: (context, state) {
        return Hero(
          tag: 'Form-Username',
          flightShuttleBuilder: flightShuttleBuilder,
          child: Material(
            color: Colors.transparent,
            child: FormzTextField(
              trailing: const Icon(Icons.person_outline),
              hintText: AppLocalizations.of(context)!.labelUsername,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (email) =>
                  context.read<LoginBloc>().add(OnUsernameChanged(email)),
            ),
          ),
        );
      },
    );
  }
}
