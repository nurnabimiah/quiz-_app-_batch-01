


 import 'package:class_1/utils/share_pref_service/share_pref_service.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{

   bool isDark = false;

   Future<void> loadTheme() async {
     isDark = await SharePreService.getTheme();
     notifyListeners();
   }

   Future<void> toggleTheme(bool value) async{
     isDark = value;
     await SharePreService.saveTheme(value);
     notifyListeners();

   }







}