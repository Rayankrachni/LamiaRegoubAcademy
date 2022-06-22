import 'package:project/ViewModel/ConnectionServices.dart';

import '../../Views/Provider/Student_Provider.dart';

class StudentVM  {
  static StudentProvider loader  = StudentProvider();
  static ConnectionSqlServices mydb= ConnectionSqlServices.instance;

  static  Future<int> AddStudent(String name,int idgrp) async{
    int response = await mydb.insertDatabase("INSERT INTO 'Student' (fullname,idgroup) VALUES (?,?)",[name,idgrp]);
    print ("student $response");
    return response;
  }

  static   getStudents() async{
    var response = await mydb.readDatabase("SELECT * FROM 'student' ");
    if(response !=0){loader.mystudentload=true;}
    print ("student $response");
    return response;
  }

  static   getStudentsbyid(int id) async{

    print("+++++++++++++++$id");
    String table='student'  ;
    String Column='idgroup'  ;
    var response = await mydb.getonerow(table, id, Column);
    //if(response !=0){loader.mygroupload=true;}
    print ("grrrr $response");
    return response;
  }




  static Future<int> DeleteStudent(int id) async{
    var response = await mydb.deleteDatabase('DELETE  FROM "student" WHERE "id"=$id');
    // if(response !=0){craft.mycrafts=true;}
    print ("craft dteleted $response");
    return response;
  }

}