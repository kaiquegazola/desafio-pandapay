enum TipoTransacao { ENVIADO, RECEBIDO }

class TipoTransacaoHelper {
  static String toStringValue(TipoTransacao tipoTransacao) {
    switch (tipoTransacao) {
      case TipoTransacao.ENVIADO:
        return 'ENVIADO';
      case TipoTransacao.RECEBIDO:
        return 'RECEBIDO';
      default:
        return null;
    }
  }

  static TipoTransacao toTipoTransacaoValue(String tipoTransacao) {
    switch (tipoTransacao) {
      case 'ENVIADO':
        return TipoTransacao.ENVIADO;
      case 'RECEBIDO':
        return TipoTransacao.RECEBIDO;
      default:
        return null;
    }
  }
}
