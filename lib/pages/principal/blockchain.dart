import 'package:flutter/material.dart';
import 'package:pandapay/model/transacao.dart';
import 'package:pandapay/model/usuario.dart';
import 'package:pandapay/repository/transacao_repository.dart';
import 'package:pandapay/util/transacao_fragment.dart';

class BlockchainFragment extends StatefulWidget {
  final Usuario usuario;

  BlockchainFragment(this.usuario);

  @override
  _BlockchainFragmentState createState() => _BlockchainFragmentState();
}

class _BlockchainFragmentState extends State<BlockchainFragment> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transacao>>(
        future: TransacaoRepository().getTransacoes(widget.usuario),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null &&
              snapshot.data.length > 0) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return TransacaoFragment(
                  transacao: snapshot.data[index],
                );
              },
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text("Nenhuma transação recente."),
            );
          }
        });
  }
}
