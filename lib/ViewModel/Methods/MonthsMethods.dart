import 'package:project/Models/Month.dart';
import 'package:project/Models/Student_Model.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';
import 'package:project/ViewModel/API/Month_ViewModel.dart';
import 'package:project/ViewModel/API/Student_ViewModel.dart';

import '../API/Craft_ViewModel.dart';

class MonthMethods{


  static bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  static Future<List<MonthModel>> get_Month_ByGRpid(int id) async {

    var liststd= await MonthVM.getmanagementbyid(id);
    print('groups are 444');
    List<MonthModel> Month =  (liststd as List).map((c) => MonthModel.fromMap(c)).toList();
    print('Month are $Month');
    return Month;

  }

  static void Insert_Month(int idstd, String name,String Seance1,String Seance2,String Seance3,String Seance4,String Payment)async {

    int insrtmth=   await MonthVM.AddMonth(idstd,Seance1,Seance2,Seance3,Seance4,Payment);
    if( insrtmth!= 0)
    {
      print('insrtmth added');
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtmth');
    }

  }


  static void Update_Month(int id,int idstd, String Seance1,String Seance2,String Seance3,String Seance4,String Payment)async {
    print('id$id,name$idstd');
    int insrtmth=   await MonthVM.UpDateMonth(id,idstd,Seance1,Seance2,Seance3,Seance4,Payment);
    if( insrtmth!= 0)
    {
      print('update added');
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('update results $insrtmth');
    }

  }


}