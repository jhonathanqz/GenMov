class StringHelper {
  static String onlyText({required String text}) {
    final regexp = RegExp(r'\d');
    var onlyTextSanitized = text.replaceAll(regexp, '');
    return onlyTextSanitized;
  }

  static String onlyNumberString({required String text}) {
    final regexp = RegExp(r'\D');
    var onlySanitized = text.replaceAll(regexp, '');
    return onlySanitized
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('-', '');
  }

  static double toDouble({required String value}) {
    var valueSanitized = value
        .replaceAll('R', '')
        .replaceAll('\$', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    return double.tryParse(valueSanitized) ?? 0;
  }

  static String removeCaractereSpecial(String value) {
    final regex = RegExp(r'\W'); //^0-9a-zA-Z
    final newValue = value.replaceAll('/', '-').replaceAll('\\', '-');
    if (newValue.contains(regex)) {
      return newValue.replaceAll(regex, '');
    }
    return newValue;
  }
}
