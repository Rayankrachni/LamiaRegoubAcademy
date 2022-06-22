import 'package:flutter/material.dart';

class GroupProvider extends ChangeNotifier{


  bool _mygroupload=false;
  bool get mygroupload => _mygroupload;
  set mygroupload(bool value){
    _mygroupload=value;
    notifyListeners();
  }

}