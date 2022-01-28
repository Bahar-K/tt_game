import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier{
  String isim = "Bahar";
  void newCity(String name){
    isim= name;
    notifyListeners();
  }
}