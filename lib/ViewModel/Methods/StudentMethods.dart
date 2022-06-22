import 'package:project/Models/Student_Model.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';
import 'package:project/ViewModel/API/Student_ViewModel.dart';

class StudentMethods{

  static void Insert_Student(int idgrp, String name)async {

    int insrtstd=   await StudentVM.AddStudent(name,idgrp);
    if( insrtstd!= 0)
    {
      print('std added');
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtstd');
    }

  }

  static Future<List<StudentModel>> get_Students() async {

    var liststd= await StudentVM.getStudents();
    print('groups are 444');
    List<StudentModel> students =  (liststd as List).map((c) => StudentModel.fromMap(c)).toList();
    print('groups are $students');
    return students;

  }


  static Future<List<StudentModel>> get_Students_ByGRpid(int id) async {

    var liststd= await StudentVM.getStudentsbyid(id);
    print('groups are 444');
    List<StudentModel> students =  (liststd as List).map((c) => StudentModel.fromMap(c)).toList();
    print('groups are $students');
    return students;

  }


  static void Delete_Student(int id)async {

    int key=   await StudentVM.DeleteStudent(id);
    if( key!= 0)
    {
      print('grp removed');
      //craft.mycrafts=true;
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $key');
    }

  }


}