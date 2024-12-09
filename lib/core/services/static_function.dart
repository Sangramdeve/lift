class GlobalFunction{
  static String truncateString(String str, int maxLength) {
    if (str.length <= maxLength) {
      return str;
    } else {
      return '${str.substring(0, maxLength)}...';
    }
  }

 static bool validateInput(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length <= 3) {
      return false;
    } else {
      return true;
    }
  }

}