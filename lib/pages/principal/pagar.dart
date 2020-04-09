import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PagarFragment extends StatefulWidget {
  @override
  _PagarFragmentState createState() => _PagarFragmentState();
}

class _PagarFragmentState extends State<PagarFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 75,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              genButton("QR-Code", FontAwesomeIcons.qrcode, Colors.grey),
              genButton(
                  "Código de Barras", FontAwesomeIcons.barcode, Colors.blueGrey),
              genButton(
                  "Xbox", FontAwesomeIcons.xbox, Colors.green),
              genButton(
                  "PSN", FontAwesomeIcons.playstation, Colors.blue),
              genButton("Recarregar Celular", FontAwesomeIcons.mobileAlt,
                  Colors.orange),
              genButton("Voucher / Créditos", FontAwesomeIcons.solidCreditCard,
                  Colors.pinkAccent),
              genButton(
                  "Recarregar Transporte", FontAwesomeIcons.busAlt, Colors.red),
            ],
          ),
        ),
        Divider(),
        Expanded(
            child: Center(
          child: Container(
            height: 120,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                  'assets/images/PandaPay_Horizontal_SemSlogan_Black.png',),
            ),
          ),
        ))
      ],
    );
  }
}

Widget genButton(String text, IconData icon, Color color) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      OutlineButton(
        highlightedBorderColor: color,
        onPressed: () {},
        child: Icon(
          icon,
          size: 15,
          color: color,
        ),
        shape: CircleBorder(),
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.blinker(
          fontSize: 9,
          color: color,
        ),
      ),
    ],
  );
}
