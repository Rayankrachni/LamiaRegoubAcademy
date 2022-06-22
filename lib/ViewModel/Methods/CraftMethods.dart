import 'package:project/Models/CraftModel.dart';
import 'package:project/ViewModel/API/Craft_ViewModel.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';

import '../../Views/Provider/Fillier_Provider.dart';

class CraftMethods{

  static CraftProvider craft=  CraftProvider();
  static void Insert_Craft( String fullname,int duration, double price,String dmy)async {

    int insrtcleint=   await CraftVM.AddCraft(fullname,duration,price,dmy);
    if( insrtcleint!= 0)
    {
      craft.mycrafts=true;
      print('caft added');
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }

  static Future<List<CraftModel>> get_Craft() async {

  var listcraft= await CraftVM.getCraft();
  print('crafts are 777');
  List<CraftModel> cafts =  (listcraft as List).map((c) => CraftModel.fromMap(c)).toList();
  print('crafts are $cafts');
  return cafts;

  }

  static Future<List<CraftModel>> get_CraftBid(int id ) async {

    var listcraft= await CraftVM.getCraftbyid(id);
    print('crafts are 777');
    List<CraftModel> cafts =  (listcraft as List).map((c) => CraftModel.fromMap(c)).toList();
    print('crafts are $cafts');
    return cafts;

  }



  static void Delete_Craft(int id)async {

    int insrtcleint=   await CraftVM.DeleteCraft(id);
    if( insrtcleint!= 0)
    {
      print('caft removed');
      GroupVM.DeleteGroupbycradt(id);
      craft.mycrafts=true;
      // showDialog(context: context, builder:(_)=>Success_Dialog(mytext: "Client done",mywidgets :()=> HomePage()));
    }
    else {
      print('results $insrtcleint');
    }

  }

  static List<String> ? FiellierName(List<CraftModel>? craft, List<String> names){

    print('craft $craft');
    for(int i=0; i<craft!.length; i++)
    {
      print('craft ${craft[i]}');
      names.add(craft[i].namecraft!);
    }
    print('craft $names');

    return names;

  }


  static  int ? Fiellierid(List<CraftModel>? craft, String name){
    int id=0;
    for(int i=0; i<craft!.length; i++)
    {

      if(craft[i].namecraft! == name)
      {
        id=craft[i].idcraft!;
      }

    }

    return id;

  }






}

