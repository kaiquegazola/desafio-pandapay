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

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

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
        'tipoConta: ${tipoConta.toString()},continuarCom: ${continuarCom.toString()}';
    return '{$string}';
  }
}
