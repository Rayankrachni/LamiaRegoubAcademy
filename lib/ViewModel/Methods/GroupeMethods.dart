
import 'package:intl/intl.dart';
import 'package:project/Models/Groupe_Model.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';

class GroupMethods{
  static var days = DateTime.now();

  static void Insert_Groupe(int idcraft, String date,String prof,String hour)async {

    int insrtgrp=   await GroupVM.AddGroupe(idcraft,date,prof,hour);
    if( insrtgrp!= 0)
    {
      print('grp added');
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtgrp');
    }

  }

  static Future<List<GroupeModel>> get_Group() async {

    var listgrp= await GroupVM.getGroups();
    print('groups are 444');
    List<GroupeModel> groups =  (listgrp as List).map((c) => GroupeModel.fromMap(c)).toList();
    print('groups are $groups');
    return groups;

  }


  static Future<List<GroupeModel>> get_GroupByDay() async {
    String dayname=DateFormat('EEEE').format(days);
    var listgrp= await GroupVM.getGroupbyday(dayname);
    print('groups are 444');
    List<GroupeModel> groups =  (listgrp as List).map((c) => GroupeModel.fromMap(c)).toList();
    print('groups are $groups');
    return groups;

  }



  static void Delete_Groupe(int id)async {

    int insrtcleint=   await GroupVM.DeleteGroup(id);
    if( insrtcleint!= 0)
    {
      print('grp removed');
      //craft.mycrafts=true;
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }

  static void DeleteGroupbycradt(int id) async {

    int insrtcleint=   await GroupVM.DeleteGroupbycradt(id);
    if( insrtcleint!= 0)
    {
      print('grp removed');
      //craft.mycrafts=true;
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }




}