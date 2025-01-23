abstract interface class ParseMapper {
  static int stringToInt(String code) => int.parse(code);

  static String intToString(int code) => code.toString();
}
