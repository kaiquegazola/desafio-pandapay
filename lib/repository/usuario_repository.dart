import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pandapay/model/usuario.dart';

class UsuarioRepository {
  Firestore _firestore = Firestore.instance;

  Future<bool> cadastrar(Usuario usuario) async {
    await _firestore.collection("Usuario").add(usuario.toJson()).then((value) => usuario.ref = value);
    return usuario.ref != null;
  }
}
