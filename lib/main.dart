import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandapay/pages/slideshow.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(
    MaterialApp(
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      title: 'PandaPay - kaique.dev',
      theme: ThemeData(
      ),
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
                period: Duration(seconds: 3),
                loop: 1,
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
    Timer(Duration(seconds: 5), onDoneShimmer);
  }

  void onDoneShimmer() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SlideshowPage()));
  }
}
