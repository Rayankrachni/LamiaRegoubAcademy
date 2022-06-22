import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/Models/CraftModel.dart';
import 'package:project/Models/Groupe_Model.dart';
import 'package:project/Models/Student_Model.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/ViewModel/Methods/StudentMethods.dart';
import 'package:project/Views/Provider/Student_Provider.dart';
import 'package:project/Views/Ui/Details/Student_Detail.dart';
import 'package:provider/provider.dart';

import '../Creation_Diags/students_diag.dart';

class GroupeDetails extends StatefulWidget {
  GroupeModel? group;
  int? index;
  GroupeDetails({Key? key,this.group,this.index}) : super(key: key);

  @override
  _GroupeDetailsState createState() => _GroupeDetailsState();
}

class _GroupeDetailsState extends State<GroupeDetails> {
  List<StudentModel>? stdList;
  List<CraftModel>? crafty;
  List<StudentModel>? FilterList;
  StudentProvider loader  = StudentProvider();
  TextEditingController? searchkey = TextEditingController();
  void liststd_getting() async
  {
    stdList = await StudentMethods.get_Students_ByGRpid(widget.group!.id!);
    loader.mystudentload=true;
    print('ggg $stdList');
    print('g1g1g1 ${stdList![0]}');
  }

  void Craft_getting() async
  {
    crafty = await CraftMethods.get_CraftBid(widget.group!.idcraft!);
    loader.mycraftload=true;
    print('crcr $crafty');
    print('g1g1g1 ${crafty![0]}');
  }
//get_CraftBid
  Widget search(double width){
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          //color: Colors.yellow,
          width: width*0.4,
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
                FilterList=stdList!.where((c) {

                  var searchcrop=c.fullname!.toLowerCase();
                  return searchcrop.contains(value);

                } ).toList();
              });
            },
          )),
        ),
      ),
    );
  }

  @override
  void initState() {
    liststd_getting();
    Craft_getting();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return ChangeNotifierProvider.value(
      value:loader ,
      child: Consumer<StudentProvider>(
        builder: (context,manager,_){
         return  Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0,left: 20,right: 20),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0,left:10),
                        child: SizedBox(
                          width: width,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child:
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:  [
                                      IconButton(onPressed: (){
                                        Navigator.pop(context);
                                      },
                                        icon: Icon(Icons.arrow_back,size: 30,color: MyStyle.deepyellow,),),
                                      SizedBox(width: 20,),

                                      Text(' Groupe ${widget.index} Management ' ,style: MyStyle.LoginTitlestyle,),

                                      Icon(Icons.people,size: 25,color: MyStyle.deepyellow,),
                                      SizedBox(width: 20,),
                                    ],
                                  )
                                  ,
                                ),
                              ),
                              //SizedBox(width: 30,),
                              search(width),
                              GestureDetector(

                                  onTap: (){
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context, builder: (_)=> AddStudent(idgrp: widget.group!.id!,)).then((v)
                                    {
                                      setState(() {
                                        initState();
                                      });
                                    }
                                    );
                                  },
                                  child:  Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: Align (
                                      alignment: Alignment.topRight,
                                      child: Container(
                                            width: width*0.1,
                                            height: 30,
                                            decoration: BoxDecoration(

                                                color: MyStyle.deepyellow,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle,))),
                                    ),
                                  ),
                                  ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
    /*     Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10,bottom: 10),
                        child: Row(
                          children:  [
                            const Text('Les Information General du Groupes',style: MyStyle.LoginTitlestyle,),


                      *       Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 20),
                              child: Container(
                                  color: Colors.grey,
                                  height: 2,
                                  width: width*0.6,
                                  child: SizedBox()),
                            )
                          ],
                        ),
                      ),,*/
                      const SizedBox(height: 30,),
                      SizedBox(
                        // color: MyStyle.muted,
                        height: width*0.07,
                        width: width*0.9,

                        child:
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(Icons.people),
                              SizedBox(width: 10,),
                              Text('Groupe',style: MyStyle.LoginTitlestyle,),
                              SizedBox(width: 30,),
                              Text('Groupe ${widget.index}  ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                              SizedBox(width: 30,),
                              Text('Fillier',style: MyStyle.LoginTitlestyle,),
                              SizedBox(width: 30,),
                              Text('${crafty![0].namecraft} ' ,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                              SizedBox(width: 30,),
                              Icon(Icons.person),
                              SizedBox(width: 10,),
                              Text('Professeur',style: MyStyle.LoginTitlestyle,),
                              SizedBox(width: 30,),
                              Text('${widget.group!.prof!}  ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                              SizedBox(width: 30,),
                              Icon(Icons.access_time),
                              SizedBox(width: 10,),
                              Text('Temp:',style: MyStyle.LoginTitlestyle,),
                              SizedBox(width: 30,),
                              Text('${widget.group!.hour!+' '+widget.group!.time!}  ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                            ],

                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10,bottom: 10),
                        child: Row(
                          children:  const [

                            Text('Les Apprenants Existeess',style: MyStyle.LoginTitlestyle,),
                            SizedBox(width: 20,),

                            Icon(Icons.school,color: MyStyle.deepyellow, ),


                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        height: 250,
                        width: width * 0.9,
                        //color: Colors.m,
                        child: !manager.mystudentload || !manager.mycraftload ?  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            CircularProgressIndicator(),
                            SizedBox(height: 30,),
                            Text('Loading ....')
                          ],
                        )
                            :stdList?.isEmpty ?? true ? Center(child: Text('Il n existe Rien'))
                       : ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: searchkey!.text.isNotEmpty ? FilterList!.length:stdList?.length,
                              itemBuilder: (BuildContext context ,int index){

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StudentDetail(student:searchkey!.text.isNotEmpty ? FilterList![index]:stdList![index],duration: crafty![0].duration, )));

                                    },
                                    child: Container(
                                        width: width*0.18,
                                        // color: MyStyle.muted,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  blurRadius: 1,
                                                  spreadRadius:1,
                                                  offset: Offset(0,1)
                                              )
                                            ],
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children:  [
                                              Align(
                                                  alignment:Alignment.topRight,
                                                  child: IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,size: 15,))),
                                              const CircleAvatar(
                                                backgroundColor: MyStyle.muted,
                                                backgroundImage: AssetImage('Assets/grp.png'),radius: 35,),
                                              SizedBox(height: 10,),
                                              Text(searchkey!.text.isNotEmpty ? FilterList![index].fullname! :stdList![index].fullname!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),

                                            ],
                                          ),
                                        )),
                                  ),
                                );
                              }),),
                      ),



                    ],
                  ),
                ),
              ),
            ),

          );
        },

      ),
    );
  }
}
