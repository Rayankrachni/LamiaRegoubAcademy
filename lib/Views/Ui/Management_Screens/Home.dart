

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:provider/provider.dart';

import '../../../Models/CraftModel.dart';
import '../../../Models/Groupe_Model.dart';
import '../../../ViewModel/Methods/CraftMethods.dart';
import '../../../ViewModel/Methods/GroupeMethods.dart';
import '../../Provider/Fillier_Provider.dart';
import '../../Provider/Group_Provider.dart';
import '../../Provider/Home_Provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CraftModel>? craftList;
  List<GroupeModel>? grpList;
  HomeProvider loader= HomeProvider();

  void listcraft_getting() async {
    craftList = await CraftMethods.get_Craft();
    print(!loader.mycrafts);
    loader.mycrafts=true;
    print('l1l1l1 ${craftList![0]}');
  }
  void listgrp_getting() async {
    grpList = await GroupMethods.get_GroupByDay();
    print('ggg $grpList');
    loader.homegroupes=true;
    print('g1g1g1 ${grpList![0]}');
  }

  @override
  void initState() {
    listcraft_getting();
    listgrp_getting();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return ChangeNotifierProvider.value(
      value: loader,
      child: Consumer<HomeProvider>(
        builder:  (context,provider1,_){
          return Container(
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
                padding: const EdgeInsets.only(left: 25,right:20,top: 10),

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
                                    Icon(Icons.home,size: 30,color: MyStyle.deepyellow,),
                                    SizedBox(width: 20,),
                                    Text(' Page D accueil ' ,style: MyStyle.LoginTitlestyle,)
                                  ],
                                )
                                ,
                              ),
                            ),
                            // SizedBox(width: 30,),

                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                //color: Colors.yellow,
                                width: width*0.3,
                                child: Center(child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: 'Recherche',
                                      hintStyle: MyStyle.searchstyle,
                                      suffixIcon: Icon(Icons.search,size: 18,),

                                      contentPadding: EdgeInsets.only(top:15)
                                  ),
                                )),
                              ),
                            ),

                            /* GestureDetector(

                              onTap: (){
                                print("kkk");
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
                                    child: Center(child: const Text('Ajouter',style: MyStyle.addbuttonstyle,))),
                              )),*/
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
                        child: Row(
                          children:  [
                            const Text('Groupe D aujourdhui',style: MyStyle.LoginTitlestyle,),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 20),
                              child: Container(
                                  color: MyStyle.deepyellow,
                                  height: 2,
                                  width: width*0.6,
                                  child: const SizedBox()),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 250,
                        width: width * 0.8,
                        //color: Colors.m,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },),
                            child: !provider1.homegroupes ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                CircularProgressIndicator(),
                                SizedBox(height: 30,),
                                Text('Loading ....')
                              ],
                            )
                                :grpList?.isNotEmpty ?? true ?
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: grpList?.length,
                                itemBuilder: (BuildContext context ,int index){

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: width*0.2,
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
                                              Text('Grpoupe $index ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                                              Text(grpList![index].time!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                                              Text(grpList![index].prof!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),

                                            ],
                                          ),
                                        )),
                                  );
                                }):const Center(child: Text('Il n existe Rien'))),
                      ),

                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
                        child: Row(
                          children:  [
                            Text('Filliers Existee',style: MyStyle.LoginTitlestyle,),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0,left: 20),
                              child: Container(
                                  color: MyStyle.deepyellow,
                                  height: 2,
                                  width: width*0.6,
                                  child: const SizedBox()),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 250,
                        width: width * 0.8,
                        //color: Colors.m,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },),
                            child: !provider1.mycrafts ?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                CircularProgressIndicator(),
                                SizedBox(height: 30,),
                                Text('Loading ....')
                              ],
                            )
                                :craftList?.isNotEmpty ?? true ?
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: craftList?.length,
                                itemBuilder: (BuildContext context ,int index){

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: width*0.2,
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
                                              Text(craftList![index].namecraft!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                                              SizedBox(height: 10,),
                                              Text(craftList![index].duration!.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                                              //   Text('jeudi 9-12 ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)

                                            ],
                                          ),
                                        )),
                                  );
                                })

                                :const Center(child: Text('Il n existe Rien'))),
                      ),
                      const SizedBox(height: 50,)


                    ],
                  ),
                ),
              )

          );
        },

      ),
    );
  }
}

