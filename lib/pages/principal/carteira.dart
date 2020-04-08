import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarteiraFragment extends StatefulWidget {
  @override
  _CarteiraFragmentState createState() => _CarteiraFragmentState();
}

class _CarteiraFragmentState extends State<CarteiraFragment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      children: [
        cardSaldo(),
        SizedBox(
          height: 10,
        ),
        cardBotoes(),
        SizedBox(
          height: 10,
        ),
        cardTragaAmigos(),
        SizedBox(
          height: 10,
        ),
        cardBottomBotoes(),
      ],
    );
  }

  Widget cardSaldo() {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Meu saldo:", style: GoogleFonts.robotoCondensed()),
                SizedBox(
                  height: 5,
                ),
                Text("R\$ 999,00",
                    style:
                        GoogleFonts.roboto(fontSize: 22, color: Colors.green)),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: OutlineButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                    Text(
                      "Adicionar dinheiro",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBotoes() {
    return Row(
      children: [
        Container(
            height: 250,
            child: genButton("Peça já o seu cartão",
                FontAwesomeIcons.creditCard, Colors.grey)),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: [
              genButton("Recarregar Celular", FontAwesomeIcons.mobileAlt,
                  Colors.blue),
              genButton("Voucher / Créditos", FontAwesomeIcons.solidCreditCard,
                  Colors.orange),
              genButton(
                  "Recarregar Transporte", FontAwesomeIcons.busAlt, Colors.red),
              genButton("Ajuda", FontAwesomeIcons.phoneSquare, Colors.green),
            ],
          ),
        )
      ],
    );
  }

  Widget cardBottomBotoes() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: OutlineButton(onPressed: () {}, child: Text("Sacar"))),
        SizedBox(
          width: 35,
        ),
        Expanded(
            child: OutlineButton(onPressed: () {}, child: Text("Depositar"))),
      ],
    );
  }

  Widget genButton(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlineButton(
        highlightedBorderColor: color,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 36,
              color: color,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.blinker(
                fontSize: 12,
                color: color,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget cardTragaAmigos() {
    return Card(
      color: Colors.blue[300],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(16.0),
            child: FaIcon(
              FontAwesomeIcons.bullhorn,
              size: 32,
              color: Colors.lightBlueAccent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Traga seus amigos e transfira ilimitadamente!",
                    style: GoogleFonts.roboto(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Transferências entre usuários PandaPay são grátis e não dependem do expediente bancário. Transfira quantas vezes quiser e quando quiser.",
                    style: GoogleFonts.robotoCondensed(fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Convidar Amigos",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
