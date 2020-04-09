import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pandapay/model/tipo_transacao.dart';
import 'package:pandapay/model/transacao.dart';

class TransacaoFragment extends StatelessWidget {
  final Transacao transacao;

  TransacaoFragment({this.transacao});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        elevation: 5.0,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            height: deviceSize.height * 0.1,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 10.0,
                  color: transacao.tipoTransacao == TipoTransacao.ENVIADO
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  TipoTransacaoHelper.toStringValue(transacao.tipoTransacao),
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      transacao.id ?? '',
                      style: GoogleFonts.robotoCondensed(fontSize: 12),
                      overflow: TextOverflow.clip,
                    ),
                    if (transacao.tipoTransacao == TipoTransacao.ENVIADO) ...[
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        color: transacao.tipoTransacao == TipoTransacao.ENVIADO
                            ? Colors.red
                            : Colors.green,
                      ),
                      Text(transacao.recebeu.nome ?? ''),
                    ],
                    if (transacao.tipoTransacao == TipoTransacao.RECEBIDO) ...[
                      Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: transacao.tipoTransacao == TipoTransacao.ENVIADO
                            ? Colors.red
                            : Colors.green,
                      ),
                      Text(transacao.enviou.nome ?? ''),
                    ],
                    Text(
                      'R\$ ' + transacao.valor.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: transacao.tipoTransacao == TipoTransacao.ENVIADO
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  DateFormat('dd/MM/yyyy HH:mm').format(transacao.data),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
