import 'package:pandapay/model/tipo_transacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pandapay/model/usuario.dart';

class Transacao {
  String id;
  DocumentReference ref;
  TipoTransacao tipoTransacao;
  Usuario enviou;
  Usuario recebeu;
  double valor;
  DateTime data;

  Transacao(
      {this.id,
      this.ref,
      this.tipoTransacao,
      this.enviou,
      this.recebeu,
      this.valor,
      this.data});

  Transacao.fromJson(Map<String, dynamic> json, String documentID) {
    id = documentID;
    tipoTransacao = TipoTransacaoHelper.toTipoTransacaoValue(json['tipoTransacao']);
    enviou = json['enviou'];
    recebeu = json['recebeu'];
    valor = double.parse(json['valor'].toString());
    data = ( json["data"] as Timestamp).toDate();
  }

}
