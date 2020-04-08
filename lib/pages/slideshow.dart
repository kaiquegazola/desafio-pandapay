import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:pandapay/pages/cadastro.dart';
import 'package:pandapay/pages/entrar.dart';

class SlideshowPage extends StatefulWidget {
  @override
  _SlideshowPageState createState() => _SlideshowPageState();
}

class _SlideshowPageState extends State<SlideshowPage> {
  List<String> descriptionText = [
    "Pague de onde estiver:\t\nContas, boletos, recargas e muito mais.",
    "Transferências instantâneas e ilimitadas:\t\nSem taxas e com a segurança do Blockchain.",
    "Cansado de pagar taxas?\t\nO PandaPay é pra você!"
  ];
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        widgetTitle:
            Image.asset("assets/images/PandaPay_Silhueta_SemSlogan_White.png"),
        backgroundImage: "assets/images/slider/slide1.png",
        colorBegin: Colors.white,
        colorEnd: Colors.blue,
        widgetDescription: bottomButtons(0),
      ),
    );
    slides.add(
      new Slide(
        widgetTitle:
            Image.asset("assets/images/PandaPay_Silhueta_SemSlogan_White.png"),
        backgroundImage: "assets/images/slider/slide2.png",
        colorBegin: Colors.white,
        colorEnd: Colors.blue,
        widgetDescription: bottomButtons(1),
      ),
    );
    slides.add(
      new Slide(
        widgetTitle:
            Image.asset("assets/images/PandaPay_Silhueta_SemSlogan_White.png"),
        backgroundImage: "assets/images/slider/slide3.png",
        colorBegin: Colors.white,
        colorEnd: Colors.blue,
        widgetDescription: bottomButtons(2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: IntroSlider(
              slides: this.slides,
              isShowSkipBtn: false,
              isShowDoneBtn: false,
              isShowPrevBtn: false,
              colorDot: Colors.white30,
              colorActiveDot: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButtons(int description) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          descriptionText[description],
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          textAlign: TextAlign.center,
          maxLines: 100,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 45,
        ),
        RaisedButton(
          color: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CadastroPage()));
          },
          child: Text("Criar uma conta"),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => EntrarPage()));
          },
          child: Text(
            "Já tem cadastro no PandaPay?",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
