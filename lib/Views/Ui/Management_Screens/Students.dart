

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/Student_Model.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/StudentMethods.dart';
import 'package:provider/provider.dart';

import '../../Provider/Student_Provider.dart';
import 'ListViews/Students_ListView.dart';


class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);


  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  List<StudentModel>? stdList;
  List<StudentModel>? FilterList;
  StudentProvider loader  = StudentProvider();
  TextEditingController? searchkey = TextEditingController();
  void liststd_getting() async
  {
    stdList = await StudentMethods.get_Students();
    loader.mystudentload=true;
    print('ggg $stdList');
    print('g1g1g1 ${stdList![0]}');
  }


  @override
  void initState() {
    liststd_getting();
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
              FilterList=stdList!.where((c) {

                var searchcrop=c.fullname!.toLowerCase();
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
      child: Consumer<StudentProvider>(
        builder: (build,studentmanager,_){

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
                                      Icon(Icons.person,size: 30,color: MyStyle.deepyellow,),
                                      SizedBox(width: 20,),
                                      Text(' Apprenants Managemet ' ,style: MyStyle.LoginTitlestyle,)
                                    ],
                                  )
                                  ,
                                ),
                              ),
                              //   SizedBox(width: 30,),
                              search(width),

                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
                          child: Row(
                            children:  [
                              Text('Les Apparenants  Existeess',style: MyStyle.LoginTitlestyle,),

                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 20),
                                child: Container(
                                    color: MyStyle.deepyellow,
                                    height: 2,
                                    width: width*0.55,
                                    child: SizedBox()),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: height*0.7,
                          width: width * 0.8,
                          //color: Colors.m,
                          child: !studentmanager.mystudentload ?
                           Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:const [
                                CircularProgressIndicator(),
                                SizedBox(height: 30,),
                                Text('Loading ....')
                              ],
                            )
                              :stdList?.isEmpty ?? true ? Center(child: Text('Il n existe Rien'))
                              :GridView.builder(

                                //scrollDirection: Axis.horizontal,
                                itemCount: searchkey!.text.isNotEmpty ? FilterList!.length:stdList?.length,
                                itemBuilder: (BuildContext context ,int index){

                                  return StudentItemList(student:searchkey!.text.isNotEmpty ? FilterList![index]: stdList![index],);
                                },
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing:14.0,
                                ),),),

                        const SizedBox(height: 30,),



                      ],
                    ),
                  ),
                ),

              )
          );
        },

      ),
    );
  }
}
