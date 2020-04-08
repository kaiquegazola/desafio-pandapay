import 'package:mobx/mobx.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store{

  @observable
  int tipoConta = 0;

  @observable
  int continuarCom;

  @action
  void setContinuarCom(int value) => continuarCom = value;

  @action
  void setTipoConta(int value) => tipoConta = value;

}