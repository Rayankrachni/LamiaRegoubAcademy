import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{


  bool _mycrafts=false;
  bool get mycrafts => _mycrafts;
  set mycrafts(bool value){
    _mycrafts=value;
    notifyListeners();
  }

  bool _homegroupes=false;
  bool get homegroupes => _homegroupes;
  set homegroupes(bool value){
    _homegroupes=value;
    notifyListeners();
  }

}