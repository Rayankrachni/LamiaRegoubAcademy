import 'package:flutter/material.dart';

class MonthProvider extends ChangeNotifier{


  bool _mymonth=false;
  bool get mymonth => _mymonth;
  set mymonth(bool value){
    _mymonth=value;
    notifyListeners();
  }



}