// validators.dart
String? validateEmail(String? input) {
  if (input == null || input.isEmpty) {
    return "Email darf nicht leer sein";
  }
  if (input.length <= 5) {
    return "Email muss mindestens aus 6 Zeichen bestehen";
  }
  if (!input.contains("@")) {
    return 'Email muss das Zeichen "@" enthalten';
  }
  if (!(input.endsWith(".com") || input.endsWith(".de"))) {
    return 'Email muss mit ".com" oder ".de" enden';
  }
  return null;
}

String? validatePw(String? input) {
  if (input == null || input.isEmpty) {
    return "Passwort darf nicht leer sein";
  }
  if (input.length < 6 || input.length > 12) {
    return "Passwort muss zwischen 6 und maximal 12 Zeichen lang sein";
  }
  return null;
}
