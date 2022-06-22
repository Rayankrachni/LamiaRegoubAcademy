import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/Models/CraftModel.dart';
import 'package:project/ViewModel/API/Student_ViewModel.dart';
import 'package:project/ViewModel/Methods/StudentMethods.dart';

import '../../../ViewModel/Methods/CraftMethods.dart';



class AddStudent extends StatefulWidget {
  int? idgrp;
  AddStudent({Key? key,this.idgrp}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  List<CraftModel>? craftList;
  TextEditingController? _nom_apparent;
  void listcraft_getting() async {
    craftList = await CraftMethods.get_Craft();
    //print(!craft.mycrafts);
    //craft.mycrafts=true;
    print('l1l1l1 ${craftList![0]}');
  }
  String get name => _nom_apparent!.text;

  @override
  void initState() {
    // TODO: implement initState
    _nom_apparent= new TextEditingController();
    listcraft_getting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
     body:AlertDialog(
       elevation: 0,
       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(15.0))),
       content: Builder(
           builder: (context)
           { return  Stack(
             alignment: Alignment.center,
             clipBehavior: Clip.none,
             children: [
               SizedBox(
                 width:MediaQuery.of(context).size.width*0.37 ,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisSize:MainAxisSize.min,
                   children: [
                     SizedBox(height: MediaQuery.of(context).size.width *0.01 ),
                     const Text(
                       'Ajouter une Apparants',
                       style: MyStyle.LoginTitlestyle,
                       textAlign: TextAlign.center,

                     ),
                     SizedBox(height:40),
                     TextFormField(
                       controller: _nom_apparent,
                       decoration: const InputDecoration(
                         hintText: 'Nom du apparent',
                         hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                         suffixIcon: Icon(Icons.lock ,size: 17,),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(15))
                         ),

                       ),
                     ),
                     SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(

                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.14,
                                    height: 40,
                                    decoration: BoxDecoration(

                                    //    color: MyStyle.deepyellow,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Text('Annuler',style: MyStyle.addbuttonstyle1,))),
                              )),
                          GestureDetector(

                            onTap: (){
                               StudentMethods.Insert_Student(widget.idgrp!, name);
                               Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.14,
                                    height: 40,
                                    decoration: BoxDecoration(

                                        color: MyStyle.deepyellow,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle,))),
                              ))
                        ],
                      )

                   ],
                 ),
               ),
               Positioned(
                 top: - MediaQuery.of(context).size.width/25 +23,
                 right: -MediaQuery.of(context).size.width/29-30,
                 child:  Container(
                     width : MediaQuery.of(context).size.width/9,
                     decoration: const BoxDecoration(
                           color:Colors.red,
                         shape: BoxShape.circle
                     ),
                     child:  Padding(
                      padding: EdgeInsets.all(1),
                       child: IconButton(
                          icon: const Icon(Icons.close,size:24,
                         color: Colors.white,),
                         onPressed: () {
                            Navigator.pop(context);
                         },
                       ),
                     ),
                   ),
                 ),

             ],
           );}),
     )
    );
  }
}
