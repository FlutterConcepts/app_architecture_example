abstract interface class TypeParser {
  static int stringToInt(String code) => int.parse(code);
  static String intToString(int code) => code.toString();
}
