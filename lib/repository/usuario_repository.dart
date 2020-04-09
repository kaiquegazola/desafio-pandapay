import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pandapay/model/usuario.dart';

class UsuarioRepository {
  Firestore _firestore = Firestore.instance;

  Future<bool> cadastrar(Usuario usuario) async {
    await _firestore
        .collection("Usuario")
        .document(usuario.email)
        .setData(usuario.toJson());
    await _firestore
        .collection("Usuario")
        .document(usuario.email)
        .get()
        .then((value) => usuario.ref = value.reference);
    return usuario.ref != null;
  }

  Future<Usuario> entrar(Usuario usuario) async {
    QuerySnapshot usuarios1 = await _firestore
        .collection("Usuario")
        .where('documento', isEqualTo: usuario.email)
        .where('senha', isEqualTo: usuario.senha)
        .getDocuments();
    QuerySnapshot usuarios2 = await _firestore
        .collection("Usuario")
        .where('email', isEqualTo: usuario.email)
        .where('senha', isEqualTo: usuario.senha)
        .getDocuments();
    if (usuarios1.documents.length > 0) {
      return Usuario.fromJson(usuarios1.documents[0].data);
    }
    if (usuarios2.documents.length > 0) {
      return Usuario.fromJson(usuarios2.documents[0].data);
    }
    return null;
  }

  Future<Usuario> getUsuario(FirebaseUser user) async {
    var usuario =
        await _firestore.collection("Usuario").document(user.email).get();
    return usuario.data == null ? null : Usuario.fromJson(usuario.data);
  }
}
