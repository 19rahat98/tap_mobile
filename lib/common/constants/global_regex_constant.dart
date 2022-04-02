class GlobalRegexConstant {
  /// регулярное для таймера
  static final regTimer = RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$');

  /// проверка на символы
  static final regDigits = RegExp(r'[^0-9]');

  /// проверка на цифры
  static final regNumbers = RegExp(r'[^\d]');

  /// проверка на символы в платежах
  static final regPayments = RegExp(r'[,+,-]');

  /// регулярное выражение на параль
  static final regPassword =
      RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!?@#\$&*~]).{8,}$');

  /// резулярное выражения для проверки mp3
  static final mp3Regex = RegExp(r'.mp3');

  /// регулярное выражение для локации
  static final regLocation =
      RegExp(r"[\p{L}0-9 ,.-]", caseSensitive: false, unicode: true);

  /// регулярное выражение для добавление пробела через каждые 3 символа
  static final regBalance = RegExp(r'\B(?=(\d{3})+(?!\d))');

  /// Должен содержать хотя бы один большие буквы
  static final shouldContainAtLeastOneUpperCase = RegExp(r'^(?=.*?[A-Z])');

  /// Должен содержать хотя бы один маленькие буквы
  static final shouldContainAtLeastOneLowerCase = RegExp(r'^(?=.*?[a-z])');

  /// Должен содержать хотя бы одну цифру
  static final shouldContainAtLeastOneDigit = RegExp(r'^(?=.*?[0-9])');

  /// Должен содержать хотя бы один специальный символ
  static final shouldContainAtLeastOneSpecialCharacter = RegExp(r'^(?=.*?[!?@#\$&*~])');

  /// Должен быть не менее 8 символов в длину
  static final mustBeAtLeastEightCharactersInLength = RegExp(r'^.{8,}$');
}
