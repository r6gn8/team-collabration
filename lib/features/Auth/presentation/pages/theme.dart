import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class Themeervice{
  final lightTheme =ThemeData.light().copyWith(
    primaryColor:Colors.blue,
      appBarTheme:const AppBarTheme(),
      disabledColor: Colors.white,
  );

  final darkTheme =ThemeData.light().copyWith(
    primaryColor:Colors.blue,
    appBarTheme:const AppBarTheme(),
    disabledColor: Colors.black,
  );


  final _getStorge =GetStorage();
  final _darkThemeKey ='isDarkTheme';

  void saveThemeData(bool isDarkMode){
    _getStorge.write(_darkThemeKey, isDarkMode);
  }


  bool isSaveDarkMode(){
    return _getStorge.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode (){
    return isSaveDarkMode() ?ThemeMode.dark : ThemeMode.light;
  }
  void changeTheme (){
    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light :ThemeMode.dark);
    saveThemeData(!isSaveDarkMode());
  }
}