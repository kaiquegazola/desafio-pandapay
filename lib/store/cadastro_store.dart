import 'package:mobx/mobx.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  @observable
  int tipoConta = 0;

  @observable
  int continuarCom;

  @observable
  String codigoSMS;

  @observable
  String verificationCode;

  @observable
  bool celularVerificado = false;

  @observable
  String erroVerificacao;

  @action
  void setErroVerificacao(String value) => erroVerificacao = value;

  @action
  void setCodigoSMS(String value) {
    erroVerificacao = null;
    codigoSMS = value;
  }

  @action
  void setVerificationCode(String value) => verificationCode = value;

  @action
  void setCelularVerificado(bool value) => celularVerificado = value;

  @action
  void setContinuarCom(int value) => continuarCom = value;

  @action
  void setTipoConta(int value) => tipoConta = value;
}
