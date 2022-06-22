import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/API/Student_ViewModel.dart';
import 'package:project/ViewModel/Methods/StudentMethods.dart';

import '../../../ViewModel/Methods/CraftMethods.dart';



class DeleteItems extends StatefulWidget {
  int? id;
  DeleteItems({Key? key,this.id}) : super(key: key);

  @override
  _DeleteItemsState createState() => _DeleteItemsState();
}

class _DeleteItemsState extends State<DeleteItems> {


  @override
  void initState() {
    // TODO: implement initState

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
                                  CraftMethods.Delete_Craft(widget.id!);
                                  Navigator.pop(context);
                                  //StudentMethods.Insert_Student(1, name);
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
                                      child: const Center(child: Text('Delete',style: MyStyle.addbuttonstyle,))),
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
