import 'package:flutter/material.dart';

class StudentProvider extends ChangeNotifier{


  bool _mystudentload=false;
  bool get mystudentload => _mystudentload;
  set mystudentload(bool value){
    _mystudentload=value;
    notifyListeners();
  }

  bool _mycraftload=false;
  bool get mycraftload => _mycraftload;
  set mycraftload(bool value){
    _mycraftload=value;
    notifyListeners();
  }


  bool _delete=false;
  bool get delete => _delete;
  set delete(bool value){
    _delete=value;
    notifyListeners();
  }

}