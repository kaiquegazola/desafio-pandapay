enum TipoUsuario { PESSOA_FISICA, PESSOA_JURIDICA }

class TipoUsuarioHelper {
  static String toStringValue(TipoUsuario tipoUsuario) {
    switch (tipoUsuario) {
      case TipoUsuario.PESSOA_FISICA:
        return 'PESSOA_FISICA';
      case TipoUsuario.PESSOA_JURIDICA:
        return 'PESSOA_JURIDICA';
      default:
        return null;
    }
  }

  static TipoUsuario toTipoUsuarioValue(String tipoUsuario) {
    switch (tipoUsuario) {
      case 'PESSOA_FISICA':
        return TipoUsuario.PESSOA_FISICA;
      case 'PESSOA_JURIDICA':
        return TipoUsuario.PESSOA_JURIDICA;
      default:
        return null;
    }
  }
}
