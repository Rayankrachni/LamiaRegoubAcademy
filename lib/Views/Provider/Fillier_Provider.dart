
import 'package:flutter/material.dart';

class CraftProvider extends ChangeNotifier{


  bool _mycrafts=false;
  bool get mycrafts => _mycrafts;
  set mycrafts(bool value){
    _mycrafts=value;
    notifyListeners();
  }

}