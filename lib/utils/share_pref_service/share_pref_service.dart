

import 'package:shared_preferences/shared_preferences.dart';

class SharePreService{

 static Future<void> saveTheme(bool isDark) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isDarkTheme", isDark);
  }

  static Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isDarkTheme") ?? false;
  }



}

