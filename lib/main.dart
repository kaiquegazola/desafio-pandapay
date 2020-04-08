import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandapay/pages/principal.dart';
import 'package:pandapay/pages/slideshow.dart';
import 'package:pandapay/repository/usuario_repository.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      title: 'PandaPay - kaique.dev',
      theme: ThemeData(primaryColor: Color(0xFF191919)),
    ),
  );
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF191919),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Color(0xFF333333),
                child: Image.asset(
                    'assets/images/PandaPay_Silhueta_SemSlogan_White.png'),
                period: Duration(seconds: 2),
                loop: 0,
              ),
            ),
            Text(
              "by kaique.dev",
              style: GoogleFonts.robotoCondensed(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), onDoneShimmer);
  }

  Future<void> onDoneShimmer() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.currentUser().then((value) async {
      if (value != null) {
        var usuario = await UsuarioRepository().getUsuario(value);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PrincipalPage(usuario)));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SlideshowPage()));
      }
    });
  }
}
