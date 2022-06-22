import 'package:intl/intl.dart';
import 'package:project/ViewModel/ConnectionServices.dart';


class MonthVM  {

  static ConnectionSqlServices mydb= ConnectionSqlServices.instance;


  static  Future<int> AddMonth(int iduser,String S1,String S2,String S3,String S4,String Pay) async{
    int response = await mydb.insertDatabase("INSERT INTO 'monthmange' (idstudent,Seance1,Seance2,Seance3,Seance4,Payment) VALUES (?,?,?,?,?,?)",[iduser,S1,S2,S3,S4,Pay]);
    print ("month $response");
    return response;
  }

  static  Future<int> UpDateMonth(int id,int iduser,String S1,String S2,String S3,String S4,String Pay) async{
    int response = await mydb.updateDatabase("UPDATE  'monthmange' SET idstudent=?,Seance1=?,Seance2=?,Seance3=?,Seance4=?,Payment=?   WHERE id= ?",[iduser,S1,S2,S3,S4,Pay,id]);
    print ("month $response");
    return response;
  }



 /* static getCraft() async{
    var response = await mydb.readDatabase("SELECT * FROM 'craft' ");
    if(response !=0){craft.mycrafts=true;}
    print ("craft $response");
    return response;
  }
  static Future<int> DeleteCraft(int id) async{
    var response = await mydb.deleteDatabase('DELETE  FROM "craft" WHERE "id"=$id');
    // if(response !=0){craft.mycrafts=true;}
    print ("craft dteleted $response");
    return response;
  }
*/

  static getmanagementbyid(int id) async{

    print("+++++++++++++++$id");
    String table='monthmange'  ;
    String Column='idstudent'  ;
    var response = await mydb.getonerow(table, id, Column);
    //if(response !=0){loader.mygroupload=true;}
    print ("cmmm $response");
    return response;
  }

}