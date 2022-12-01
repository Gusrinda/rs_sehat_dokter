import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

enum FormTextInputValidationError { empty }

class FormTextInput extends FormzInput<String, FormTextInputValidationError> {
  FormTextInput.pure([TextEditingController? textEditingController])
      : textEditingController =
            textEditingController ?? TextEditingController(),
        super.pure('');
  const FormTextInput.dirty({
    String value = '',
    required this.textEditingController,
  }) : super.dirty(value);

  final TextEditingController textEditingController;

  FormTextInput toDirty({String? value, bool fromTextController = false}) {
    return FormTextInput.dirty(
      textEditingController: textEditingController,
      value: value ??
          (fromTextController ? textEditingController.text : this.value),
    );
  }

  @override
  FormTextInputValidationError? validator(String? value) {
    return value?.isNotEmpty == true
        ? null
        : FormTextInputValidationError.empty;
  }
}

class FormTextInputOptional
    extends FormzInput<String, FormTextInputValidationError> {
  FormTextInputOptional.pure([TextEditingController? textEditingController])
      : textEditingController =
            textEditingController ?? TextEditingController(),
        super.pure('');
  const FormTextInputOptional.dirty({
    String value = '',
    required this.textEditingController,
  }) : super.dirty(value);

  final TextEditingController textEditingController;

  FormTextInputOptional toDirty({String? value}) {
    return FormTextInputOptional.dirty(
      textEditingController: textEditingController,
      value: value ?? this.value,
    );
  }

  @override
  FormTextInputValidationError? validator(String? value) {
    return null;
  }
}
