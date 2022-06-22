
import 'package:intl/intl.dart';
import 'package:project/ViewModel/ConnectionServices.dart';

import '../../Views/Provider/Group_Provider.dart';

class GroupVM  {
  static GroupProvider loader= GroupProvider();
  static ConnectionSqlServices mydb= ConnectionSqlServices.instance;


  static  Future<int> AddGroupe(int idcraft,String date,String prof,String hour) async{

    int response = await mydb.insertDatabase("INSERT INTO 'collection' (idcraft,Date,prof,Time) VALUES (?,?,?,?)",[idcraft,date,prof,hour]);
    print ("grp $response");
    return response;
  }

  static  getGroups() async{
    var response = await mydb.readDatabase("SELECT * FROM 'collection' ");
    if(response !=0){loader.mygroupload=true;}
    print ("collection $response");
    return response;
  }
  static  getGroupbyday(String day) async{
  print("+++++++++++++++$day");
  String table='collection';
  String Column='Time';
  var response = await mydb.getonerow(table, day, Column);
 // if(response !=0){loader.mygroupload=true;}
  print ("grrrr $response");
  return response;
  }



  static Future<int> DeleteGroup(int id) async{
    var response = await mydb.deleteDatabase('DELETE  FROM "collection" WHERE "id"=$id');
    // if(response !=0){craft.mycrafts=true;}
    print ("craft dteleted $response");
    return response;
  }

  static Future<int> DeleteGroupbycradt(int id) async{
    var response = await mydb.deleteDatabase('DELETE  FROM "collection" WHERE "idcraft"=$id');
    // if(response !=0){craft.mycrafts=true;}
    print ("craft dteleted $response");
    return response;
  }



}
