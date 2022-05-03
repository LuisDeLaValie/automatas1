class Convercion {
  //a*(bUca*)
  RegExp? regExp;

  String exprecion = "";
  bool? comprobarcadena(String cadena) {
    try {
      exprecion = exprecion.replaceAll('+', '|');
      var ex = r'^' + exprecion + r'$';
      regExp = RegExp(ex);

      var resultado1 = regExp!.hasMatch(cadena);
      return resultado1;
    } catch (e) {
      throw e;
    }
  }
}
