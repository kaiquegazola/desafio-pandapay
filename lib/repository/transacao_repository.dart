import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pandapay/model/transacao.dart';
import 'package:pandapay/model/usuario.dart';

class TransacaoRepository {
  Firestore _firestore = Firestore.instance;

  Future<List<Transacao>> getTransacoes(Usuario usuario) async {
    QuerySnapshot transacoesEnviadas = await _firestore
        .collection("Transacao")
        .where('enviou', isEqualTo: usuario.email)
        .getDocuments();
    QuerySnapshot transacoesRecebidas = await _firestore
        .collection("Transacao")
        .where('recebeu', isEqualTo: usuario.email)
        .getDocuments();

    List<Transacao> transacoesList = List();

    List<DocumentSnapshot> documentList = transacoesRecebidas.documents;
    documentList.addAll(transacoesEnviadas.documents);


    await Future.forEach(documentList, (DocumentSnapshot value) async {

      Usuario recebeu = Usuario.fromJson((await _firestore
              .collection("Usuario")
              .document(value.data['recebeu'])
              .get())
          .data);

      Usuario enviou = Usuario.fromJson((await _firestore
              .collection("Usuario")
              .document(value.data['enviou'])
              .get())
          .data);

      value.data.removeWhere((key, value) => key == "enviou");
      value.data.removeWhere((key, value) => key == "recebeu");
      value.data["enviou"] = enviou;
      value.data["recebeu"] = recebeu;

      Map<String, dynamic> newValue = {
        "enviou": enviou,
        "recebeu": recebeu,
        "valor": value.data['valor'],
        "data": value.data['data'],
        "tipoTransacao": usuario.email == enviou.email
            ? "ENVIADO"
            : "RECEBIDO"
      };
      transacoesList.add(Transacao.fromJson(newValue, value.documentID));
    });

    return transacoesList;
  }
}
