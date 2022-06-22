import 'package:intl/intl.dart';
import 'package:project/ViewModel/ConnectionServices.dart';
import 'package:project/Views/Provider/Fillier_Provider.dart';

class CraftVM  {
  static  CraftProvider craft=  CraftProvider();
  static ConnectionSqlServices mydb= ConnectionSqlServices.instance;


  static  Future<int> AddCraft(String fullname,int Duration,double price,String dmy) async{
    int response = await mydb.insertDatabase("INSERT INTO 'craft' (fullname,Duration,prix,dmy) VALUES (?,?,?,?)",[fullname,Duration,price,dmy]);
    print ("craft $response");
    return response;
  }

  static getCraft() async{
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




  static   getCraftbyid(int id) async{

    print("+++++++++++++++$id");
    String table='craft'  ;
    String Column='id'  ;
    var response = await mydb.getonerow(table, id, Column);
    //if(response !=0){loader.mygroupload=true;}
    print ("crrrrr333rrrr $response");
    return response;
  }

}