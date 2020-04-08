import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pandapay/util/custom_form_builder_validators.dart';
import 'package:pandapay/util/divider.dart';
import 'package:pandapay/util/messages.dart';
import 'package:pandapay/util/social_button.dart';

class EntrarPage extends StatefulWidget {
  @override
  _EntrarPageState createState() => _EntrarPageState();
}

class _EntrarPageState extends State<EntrarPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Image.asset(
          "assets/images/PandaPay_Horizontal_SemSlogan_Black.png",
          width: 150,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Card(
          elevation: 2,
          child: FormBuilder(
            key: _fbKey,
            autovalidate: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Seja bem-vindo(a) de volta!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      attribute: "login",
                      decoration: InputDecoration(labelText: "E-mail ou CPF"),
                      validators: [
                        CustomFormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      attribute: "senha",
                      decoration: InputDecoration(labelText: "Senha"),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      maxLines: 1,
                      validators: [
                        CustomFormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Esqueceu a sua senha do PandaPay?",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                    ),
                  ),
                  Center(
                    child: OutlineButton(
                      onPressed: _efetuarLogin,
                      child: Text(
                        "Entrar",
                      ),
                    ),
                  ),
                  entrarCom(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget entrarCom() {
    return Column(
      children: [
        DividerTile(text: "ou acesse sua conta com"),
        SocialButton(Colors.blue, FontAwesomeIcons.facebook, "Facebook", null),
        SocialButton(Colors.red, FontAwesomeIcons.google, "Google", null),
      ],
    );
  }

  void _efetuarLogin() {
    if (!_fbKey.currentState.saveAndValidate()) {
      Messages().sendWarningToast(context, 'Atenção!',
          'Verifique os dados informados antes de proseguir.');
      return;
    }
    Messages()
        .sendSuccessToast(context, 'Sucesso!', 'Aguarde enquanto carregamos suas informações...');
  }
}
