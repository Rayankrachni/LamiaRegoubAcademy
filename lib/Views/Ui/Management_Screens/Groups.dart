
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/Groupe_Model.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';
import 'package:project/ViewModel/Methods/GroupeMethods.dart';
import 'package:provider/provider.dart';
import '../../Provider/Group_Provider.dart';
import '../Creation_Diags/groups_diag.dart';
import 'ListViews/Groupe_ListView.dart';


class Groupes extends StatefulWidget {
  const Groupes({Key? key}) : super(key: key);

  @override
  _GroupesState createState() => _GroupesState();
}

class _GroupesState extends State<Groupes> {
  List<GroupeModel>? grpList;
  List<GroupeModel>? FilterList;
  TextEditingController? searchkey = TextEditingController();
  GroupProvider loader= GroupProvider();
  void listgrp_getting() async
  {
    grpList = await GroupMethods.get_Group();
    print('ggg $grpList');
    loader.mygroupload=true;
    print('g1g1g1 ${grpList![0]}');
  }

  @override
  void initState() {
    listgrp_getting();
    // TODO: implement initState
    super.initState();
  }

  Widget search(double width){
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        //color: Colors.yellow,
        width: width*0.3,
        child: Center(child: TextFormField(
          controller: searchkey ,
          decoration: const InputDecoration(

            hintText: 'Recherche',
            hintStyle: MyStyle.searchstyle,
            suffixIcon: Icon(Icons.search,size: 18,),
            contentPadding: EdgeInsets.only(top:15),

          ),
          onChanged:(value)
          {
            value=value.toLowerCase();
            setState(() {
              FilterList=grpList!.where((c) {

                var searchcrop=c.time!.toLowerCase();
                return searchcrop.contains(value);

              } ).toList();
            });
          },
        )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return ChangeNotifierProvider.value(
        value: loader,
        child: Consumer<GroupProvider>(
        builder: (build,grpmanager,_){
         return  Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 1,
                  spreadRadius:1,
                  offset: Offset(0,1)
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 1,
                    spreadRadius:1,
                    offset: Offset(0,1)
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)
          ),

          child:  Padding(
            padding: EdgeInsets.only(left: 25,right:20,top: 10),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Padding(
                          padding: const EdgeInsets.only(top: 25.0,left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child:
                            Row(
                              children: const [
                                Icon(Icons.people,size: 30,color: MyStyle.deepyellow,),
                                SizedBox(width: 20,),
                                Text(' Groupes Managemet ' ,style: MyStyle.LoginTitlestyle,)
                              ],
                            )
                            ,
                          ),
                        ),
                        //SizedBox(width: 30,),
                        search(width),
                        GestureDetector(

                            onTap: (){
                             // GroupMethods.Insert_Client(1, 'date', 'prof');
                             showDialog(
                                  barrierDismissible: true,
                                  context: context, builder: (_)=> Add_Group()).then((v)
                             {
                               setState(() {
                                 initState();
                               });
                             }
                             );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                  width: width*0.1,
                                  height: 30,
                                  decoration: BoxDecoration(

                                      color: MyStyle.deepyellow,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle,))),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
                    child: Row(
                      children:  [
                        Text('Les Groupes Existeess',style: MyStyle.LoginTitlestyle,),

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20),
                          child: Container(
                              color: MyStyle.muted,
                              height: 2,
                              width: width*0.6,
                              child: SizedBox()),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: height*0.7,
                    width: width * 0.8,
                    //color: Colors.m,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },),
                      child:!grpmanager.mygroupload?    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:const [
                          CircularProgressIndicator(),
                          SizedBox(height: 30,),
                          Text('Loading ....')
                        ],
                      )
                          :grpList?.isEmpty ?? true ? Center(child: Text('Il n existe Rien'))

                          :GridView.builder(
                          //scrollDirection: Axis.horizontal,
                            itemCount:  searchkey!.text.isNotEmpty ? FilterList!.length : grpList?.length,
                            itemBuilder: (BuildContext context ,int index){

                            return GroupeItemList(group:searchkey!.text.isNotEmpty ? FilterList![index]  : grpList![index],index: index+1,);
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing:13.0,
                        ),),),
                  ),
                  SizedBox(height: 30,),



                ],
              ),
            ),
          ),

        )
      );})
    );
  }
}
