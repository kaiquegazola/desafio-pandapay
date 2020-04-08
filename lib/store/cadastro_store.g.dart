// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  final _$tipoContaAtom = Atom(name: '_CadastroStore.tipoConta');

  @override
  int get tipoConta {
    _$tipoContaAtom.context.enforceReadPolicy(_$tipoContaAtom);
    _$tipoContaAtom.reportObserved();
    return super.tipoConta;
  }

  @override
  set tipoConta(int value) {
    _$tipoContaAtom.context.conditionallyRunInAction(() {
      super.tipoConta = value;
      _$tipoContaAtom.reportChanged();
    }, _$tipoContaAtom, name: '${_$tipoContaAtom.name}_set');
  }

  final _$continuarComAtom = Atom(name: '_CadastroStore.continuarCom');

  @override
  int get continuarCom {
    _$continuarComAtom.context.enforceReadPolicy(_$continuarComAtom);
    _$continuarComAtom.reportObserved();
    return super.continuarCom;
  }

  @override
  set continuarCom(int value) {
    _$continuarComAtom.context.conditionallyRunInAction(() {
      super.continuarCom = value;
      _$continuarComAtom.reportChanged();
    }, _$continuarComAtom, name: '${_$continuarComAtom.name}_set');
  }

  final _$codigoSMSAtom = Atom(name: '_CadastroStore.codigoSMS');

  @override
  String get codigoSMS {
    _$codigoSMSAtom.context.enforceReadPolicy(_$codigoSMSAtom);
    _$codigoSMSAtom.reportObserved();
    return super.codigoSMS;
  }

  @override
  set codigoSMS(String value) {
    _$codigoSMSAtom.context.conditionallyRunInAction(() {
      super.codigoSMS = value;
      _$codigoSMSAtom.reportChanged();
    }, _$codigoSMSAtom, name: '${_$codigoSMSAtom.name}_set');
  }

  final _$verificationCodeAtom = Atom(name: '_CadastroStore.verificationCode');

  @override
  String get verificationCode {
    _$verificationCodeAtom.context.enforceReadPolicy(_$verificationCodeAtom);
    _$verificationCodeAtom.reportObserved();
    return super.verificationCode;
  }

  @override
  set verificationCode(String value) {
    _$verificationCodeAtom.context.conditionallyRunInAction(() {
      super.verificationCode = value;
      _$verificationCodeAtom.reportChanged();
    }, _$verificationCodeAtom, name: '${_$verificationCodeAtom.name}_set');
  }

  final _$celularVerificadoAtom =
      Atom(name: '_CadastroStore.celularVerificado');

  @override
  bool get celularVerificado {
    _$celularVerificadoAtom.context.enforceReadPolicy(_$celularVerificadoAtom);
    _$celularVerificadoAtom.reportObserved();
    return super.celularVerificado;
  }

  @override
  set celularVerificado(bool value) {
    _$celularVerificadoAtom.context.conditionallyRunInAction(() {
      super.celularVerificado = value;
      _$celularVerificadoAtom.reportChanged();
    }, _$celularVerificadoAtom, name: '${_$celularVerificadoAtom.name}_set');
  }

  final _$erroVerificacaoAtom = Atom(name: '_CadastroStore.erroVerificacao');

  @override
  String get erroVerificacao {
    _$erroVerificacaoAtom.context.enforceReadPolicy(_$erroVerificacaoAtom);
    _$erroVerificacaoAtom.reportObserved();
    return super.erroVerificacao;
  }

  @override
  set erroVerificacao(String value) {
    _$erroVerificacaoAtom.context.conditionallyRunInAction(() {
      super.erroVerificacao = value;
      _$erroVerificacaoAtom.reportChanged();
    }, _$erroVerificacaoAtom, name: '${_$erroVerificacaoAtom.name}_set');
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void setErroVerificacao(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setErroVerificacao(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCodigoSMS(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setCodigoSMS(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVerificationCode(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setVerificationCode(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelularVerificado(bool value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setCelularVerificado(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContinuarCom(int value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setContinuarCom(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoConta(int value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction();
    try {
      return super.setTipoConta(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'tipoConta: ${tipoConta.toString()},continuarCom: ${continuarCom.toString()},codigoSMS: ${codigoSMS.toString()},verificationCode: ${verificationCode.toString()},celularVerificado: ${celularVerificado.toString()},erroVerificacao: ${erroVerificacao.toString()}';
    return '{$string}';
  }
}
