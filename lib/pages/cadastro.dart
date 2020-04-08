import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pandapay/store/cadastro_store.dart';
import 'package:pandapay/util/custom_form_builder_validators.dart';
import 'package:pandapay/util/divider.dart';
import 'package:pandapay/util/messages.dart';
import 'package:pandapay/util/social_button.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  CadastroStore cadastroStore = CadastroStore();
  var celularMask = new MaskTextInputFormatter(mask: '(##) #####-####');
  var cpfMask = new MaskTextInputFormatter(mask: '###.###.###-##');
  var cnpjMask = new MaskTextInputFormatter(mask: '##.###.###/####-##');
  String senhaAtual;
  String countryCode = "+55";

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
        child: FormBuilder(
          key: _fbKey,
          autovalidate: true,
          child: Observer(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DividerTile(
                  text: "Tipo de Conta",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    cadastroStore.tipoConta == 0
                        ? RaisedButton(
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              "Para mim".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : OutlineButton(
                            onPressed: () => cadastroStore.setTipoConta(0),
                            child: Text("Para mim".toUpperCase()),
                          ),
                    cadastroStore.tipoConta == 1
                        ? RaisedButton(
                            color: Colors.green,
                            onPressed: () {},
                            child: Text(
                              "Para meu negócio".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : OutlineButton(
                            onPressed: () => cadastroStore.setTipoConta(1),
                            child: Text("Para meu negócio".toUpperCase()),
                          ),
                  ],
                ),
                cadastroStore.tipoConta == 0
                    ? cadastroPessoal()
                    : cadastroEmpresarial(),
                if (cadastroStore.continuarCom == null)
                  continuarCadastro()
                else if (cadastroStore.continuarCom == 1)
                  cadastroEmail()
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget cadastroPessoal() {
    return Column(
      children: <Widget>[
        FormBuilderTextField(
          attribute: "nome",
          decoration: InputDecoration(labelText: "Nome Completo"),
          validators: [
            CustomFormBuilderValidators.required(),
            FormBuilderValidators.max(70),
          ],
        ),
        FormBuilderTextField(
          attribute: "cpf",
          decoration: InputDecoration(labelText: "CPF"),
          keyboardType: TextInputType.number,
          inputFormatters: [cpfMask],
          validators: [
            CustomFormBuilderValidators.required(),
          ],
        ),
        celularConfirm(),
      ],
    );
  }

  Widget celularConfirm() {
    return Builder(builder: (context) {
      return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Telefone Celular"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CountryCodePicker(
                        enabled: !cadastroStore.celularVerificado,
                        searchDecoration:
                            InputDecoration(labelText: 'Buscar País'),
                        onChanged: (country) {
                          countryCode = country.dialCode;
                        },
                        initialSelection: 'BR',
                        favorite: ['US', 'BR'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: FormBuilderTextField(
                        attribute: "celular",
                        decoration: InputDecoration(
                            hintText: '(XX) XXXXX-XXXX',
                            border: cadastroStore.celularVerificado
                                ? InputBorder.none
                                : null),
                        readOnly: cadastroStore.celularVerificado,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [celularMask],
                        validators: [
                          CustomFormBuilderValidators.required(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (!cadastroStore.celularVerificado)
                      Container(
                        width: 80,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () => _enviarSMS(context),
                          child: Text(
                            "Confirmar",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    if (cadastroStore.celularVerificado)
                      Center(
                        child: Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
              ],
            );
          }),
        ),
      );
    });
  }

  Widget cadastroEmpresarial() {
    return Column(
      children: <Widget>[
        FormBuilderTextField(
          attribute: "razao_social",
          decoration: InputDecoration(labelText: "Razão Social"),
          validators: [
            CustomFormBuilderValidators.required(),
            FormBuilderValidators.max(70),
          ],
        ),
        FormBuilderTextField(
          attribute: "CNPJ",
          decoration: InputDecoration(labelText: "CNPJ"),
          keyboardType: TextInputType.number,
          inputFormatters: [cnpjMask],
          validators: [
            CustomFormBuilderValidators.required(),
          ],
        ),
        celularConfirm(),
      ],
    );
  }

  Widget continuarCadastro() {
    return Column(
      children: [
        DividerTile(text: "Continuar cadastro com"),
        SocialButton(Colors.green, FontAwesomeIcons.envelope, "Email/Senha",
            () => cadastroStore.setContinuarCom(1)),
        SocialButton(Colors.blue, FontAwesomeIcons.facebook, "Facebook", null),
        SocialButton(Colors.red, FontAwesomeIcons.google, "Google", null),
      ],
    );
  }

  Widget cadastroEmail() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            attribute: "email",
            decoration: InputDecoration(labelText: "E-mail"),
            validators: [
              CustomFormBuilderValidators.required(),
              FormBuilderValidators.email(errorText: 'E-mail inválido.'),
            ],
          ),
          FormBuilderTextField(
            attribute: "senha",
            decoration: InputDecoration(labelText: "Senha"),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            maxLines: 1,
            validators: [
              CustomFormBuilderValidators.required(),
              FormBuilderValidators.minLength(8,
                  errorText: "Mínimo de 8 caracteres."),
            ],
            onFieldSubmitted: (senha) {
              senhaAtual = senha;
            },
          ),
          FormBuilderTextField(
            attribute: "confirmacao_senha",
            decoration: InputDecoration(labelText: "Senha (confirmação)"),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            maxLines: 1,
            validators: [
              CustomFormBuilderValidators.required(),
              FormBuilderValidators.minLength(8,
                  errorText: "Mínimo de 8 caracteres."),
              CustomFormBuilderValidators.confirmarSenha(senhaAtual),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Center(
              child: OutlineButton(
                onPressed: _realizarCadastro,
                child: Text(
                  "Finalizar Cadastro",
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  void _realizarCadastro() {
    if (!_fbKey.currentState.saveAndValidate()) {
      Messages().sendWarningToast(context, 'Atenção!',
          'Verifique os dados informados antes de proseguir.');
      return;
    }
    if (!cadastroStore.celularVerificado) {
      Messages().sendWarningToast(
          context, 'Atenção!', 'Confirme seu celular antes de proseguir.');
      return;
    }
    Messages()
        .sendSuccessToast(context, 'Sucesso!', 'Cadastro efetuado, aguarde...');
  }

  _enviarSMS(BuildContext context) async {
    if (!celularMask.isFill()) {
      Messages().sendWarningToast(context, 'Atenção',
          'Preencha corretamente seu celular para receber o código.');
      return;
    }

    String celular = countryCode + celularMask.getUnmaskedText();

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      print('Received phone auth credential: $phoneAuthCredential');
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      cadastroStore.setVerificationCode(verificationId);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      cadastroStore.setVerificationCode(verificationId);
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: celular,
        timeout: const Duration(seconds: 15),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

    _validarSMS(context);
  }

  Future<void> _validarSMS(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Enviamos um SMS para seu celular com um código, insira-o abaixo:'),
                Observer(builder: (_) {
                  return TextField(
                    maxLines: 1,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Código no SMS',
                        errorText: cadastroStore.erroVerificacao),
                    onChanged: (value) {
                      cadastroStore.setCodigoSMS(value);
                    },
                  );
                }),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () async {
                try {
                  final AuthCredential credential =
                      PhoneAuthProvider.getCredential(
                    verificationId: cadastroStore.verificationCode,
                    smsCode: cadastroStore.codigoSMS,
                  );
                  final FirebaseUser user =
                      (await _auth.signInWithCredential(credential)).user;
                  final FirebaseUser currentUser = await _auth.currentUser();
                  assert(user.uid == currentUser.uid);
                  if (user != null) {
                    cadastroStore.setCelularVerificado(true);
                    Navigator.of(context).pop();
                  } else {
                    cadastroStore.setErroVerificacao('Falha ao verificar.');
                  }
                } catch (error) {
                  switch (error.code) {
                    case 'ERROR_INVALID_VERIFICATION_CODE':
                      cadastroStore.setErroVerificacao('Código inválido.');
                      break;
                    default:
                      cadastroStore.setErroVerificacao(error.message);
                      break;
                  }
                }
              },
              child: Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }
}
