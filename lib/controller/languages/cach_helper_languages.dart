import 'package:shared_preferences/shared_preferences.dart';

class CachHelperLanguages {
  Future<void> setCachLanguageCode(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("Local", languageCode);
  }

  Future<String> getCachLangugeCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachLanguageCode = sharedPreferences.getString("Local");

    if (cachLanguageCode != null) {
      return cachLanguageCode;
    } else {
      return "en";
    }
  }
}
