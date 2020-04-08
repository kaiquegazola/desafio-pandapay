import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandapay/model/usuario.dart';
import 'package:pandapay/pages/slideshow.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pandapay/pages/principal/carteira.dart';

class PrincipalPage extends StatefulWidget {
  final Usuario usuario;

  PrincipalPage(this.usuario);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _auth.currentUser().then((value) => _user = value);
  }

  List<Widget> _buildScreens() {
    return [
      CarteiraFragment(),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.orange,
      ),
      Container(
        color: Colors.indigoAccent,
      ),
      Container(
        color: Colors.white,
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.wallet),
        title: ("Carteira"),
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.moneyBillWave),
        title: ("Pagar"),
        activeColor: Colors.teal,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.peopleArrows),
        title: ("Transferir"),
        activeColor: Colors.deepOrange,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.projectDiagram),
        title: ("Blockchain"),
        activeColor: Colors.indigo,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.cog),
        title: ("Ajustes"),
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: null,
          )
        ],
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              "assets/images/PandaPay_Icone_Black.png",
              height: 25,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Olá, " + widget.usuario.nome.split(" ")[0] + "!",
              style: TextStyle(color: Color(0xFF191919)),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: new ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 80,
                    color: Color(0xFFEBEEF1),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/PandaPay_Horizontal_SemSlogan_Black.png",
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundColor:
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          radius: 50,
                          child: TransitionToImage(
                            image: AdvancedNetworkImage(
                              _user?.photoUrl ??
                                  "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y",
                              useDiskCache: true,
                              cacheRule:
                              CacheRule(maxAge: const Duration(days: 7)),
                            ),
                            fit: BoxFit.fitWidth,
                            placeholder: const Icon(Icons.refresh),
                            enableRefresh: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: Text(
                            widget.usuario.nome,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              onPressed: null,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.person),
                                  Text("Minha Conta"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.exit_to_app),
                                  Text("Sair"),
                                ],
                              ),
                              onPressed: () {
                                _auth.signOut();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => SlideshowPage()));
                              },
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "by kaique.dev",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: PersistentTabView(
        controller: _controller,
        items: _navBarsItems(),
        screens: _buildScreens(),
        showElevation: false,
        navBarCurve: NavBarCurve.none,
        backgroundColor: const Color(0xFFEBEEF1),
        iconSize: 25.0,
        navBarStyle: NavBarStyle.style8,
      ),
    );
  }
}
