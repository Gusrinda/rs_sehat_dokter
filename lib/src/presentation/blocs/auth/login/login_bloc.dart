import 'dart:async';

import 'package:dokter/src/core/model/form_text_input.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
          fieldUsername: FormTextInput.pure(),
          fieldPassword: FormTextInput.pure(),
        )) {
    on<OnUsernameChanged>(_onOnEmailChanged);
    on<OnPasswordChanged>(_onOnPasswordChanged);
    on<TogglePasswordObscured>(_onTogglePasswordObscured);
  }

  FutureOr<void> _onOnEmailChanged(
      OnUsernameChanged event, Emitter<LoginState> emit) async {
    final fieldUsername = state.fieldUsername.toDirty(value: event.username);
    emit(state.copyWith(
      status: Formz.validate([fieldUsername, state.fieldPassword]),
      fieldUsername: fieldUsername,
    ));
  }

  FutureOr<void> _onOnPasswordChanged(
      OnPasswordChanged event, Emitter<LoginState> emit) async {
    final fieldPassword = state.fieldPassword.toDirty(value: event.password);
    emit(state.copyWith(
      status: Formz.validate([state.fieldUsername, fieldPassword]),
      fieldPassword: fieldPassword,
    ));
  }

  FutureOr<void> _onTogglePasswordObscured(
      TogglePasswordObscured event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscurePassword: event.obscure));
  }
}
