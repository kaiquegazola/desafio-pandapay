import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormBuilderValidators {
  static FormFieldValidator required() {
    return FormBuilderValidators.required(
        errorText: 'Este campo é obrigatório.');
  }

  static FormFieldValidator validarCPF({
    String errorText = "CPF inválido.",
  }) {
    return (valueCandidate) {
      if (valueCandidate != null && valueCandidate.isNotEmpty) {
        if (!RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$').hasMatch(valueCandidate))
          return errorText;
      }
      return null;
    };
  }

  static FormFieldValidator confirmarSenha(TextEditingController controller, {
    String errorText = "Senhas não são iguais.",
  }) {
    return (valueCandidate) {
      String senha = controller.text;
      if (valueCandidate != null && valueCandidate.isNotEmpty) {
        if (valueCandidate != senha) {
          return errorText;
        }
      }
      return null;
    };
  }
}
