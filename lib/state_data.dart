import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier{
  String isim = "# 23";
  void newCity(String name){
    isim= name;
    notifyListeners();
  }
}