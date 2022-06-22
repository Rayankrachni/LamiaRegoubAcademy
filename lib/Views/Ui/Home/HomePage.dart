

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import '../Management_Screens/Fields.dart';
import '../Management_Screens/Groups.dart';
import '../Management_Screens/Home.dart';
import '../Management_Screens/Students.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int SelectedIndex = 0;

  List<Widget> mywidget=[Home(),Field(),Groupes(),Students(),];


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor: MyStyle.scaffoldBgColor,
     //drawer: Drawer(),

      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 15),
                  child: Container(
                    height:height*0.86,
                    width: width*0.1,
                   // color: Colors.greenAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         /* Container(
                            height: height*0.1 ,
                            width: height*0.1,

                            decoration: const BoxDecoration(
                              //color: Colors.yellow,
                              image: DecorationImage(
                                image: AssetImage('Assets/lamiaregoub.png'),
                                fit: BoxFit.fill,

                              ),
                            ),
                          ),*/

                          GestureDetector(
                            onTap: (){
                              setState(() {
                                SelectedIndex=0;
                              });
                            },
                              child: Container(

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 1,
                                          spreadRadius:1,
                                          offset: Offset(0,1)
                                      )
                                    ],
                                  borderRadius: BorderRadius.circular(50)),
                                height:80,
                                width: 80,
                                child:  const Center(child: Icon(Icons.home ,color: MyStyle.deepyellow,size: 26,)),),),
                          SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                SelectedIndex=1;
                              });
                            },
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius:1,
                                        offset: Offset(0,1)
                                    )
                                  ],
                                borderRadius: BorderRadius.circular(50)
                              ),
                               height:80,
                               width: 80,
                              child: Center(child: Icon(Icons.color_lens_sharp ,color: MyStyle.deepyellow,size: 26,)),),
                          ),
                          SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                SelectedIndex=2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius:1,
                                        offset: Offset(0,1)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              height:80,
                              width: 80,
                              child: Center(child: Icon(Icons.people ,color: MyStyle.deepyellow,size: 26,)),),
                          ),
                          SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                SelectedIndex=3;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 1,
                                        spreadRadius:1,
                                        offset: Offset(0,1)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(50)
                              ),

                              height:80,
                              width: 80,
                              child: Center(child: Icon(Icons.person ,color: MyStyle.deepyellow,size: 26,)),),
                          ),
                        ],
                      ),
                    ),
                  ),

               // SizedBox(width: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0,top: 20),
                  child: SizedBox(

                      height:height*0.95,
                      width: width*0.85,
                      child: mywidget[SelectedIndex]),
                )


              ],
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}