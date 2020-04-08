import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pandapay/model/tipo_usuario.dart';

class Usuario {
  DocumentReference ref;
  TipoUsuario tipoUsuario;
  String nome;
  String documento;
  String email;
  String senha;
  String pais;
  String ddi;
  String celular;

  Usuario(
      {this.ref,
        this.tipoUsuario,
      this.nome,
      this.documento,
      this.pais,
      this.ddi,
      this.celular,
      this.email,
      this.senha});

  Usuario.fromJson(Map<String, dynamic> json) {
    tipoUsuario = TipoUsuarioHelper.toTipoUsuarioValue(json['tipoUsuario']);
    nome = json['nome'];
    documento = json['documento'];
    pais = json['pais'];
    ddi = json['ddi'];
    celular = json['celular'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipoUsuario'] = TipoUsuarioHelper.toStringValue(this.tipoUsuario);
    data['nome'] = this.nome;
    data['documento'] = this.documento;
    data['pais'] = this.pais;
    data['ddi'] = this.ddi;
    data['celular'] = this.celular;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
