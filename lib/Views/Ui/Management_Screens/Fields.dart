import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/Models/CraftModel.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/Views/Provider/Fillier_Provider.dart';
import 'package:project/Views/Ui/Creation_Diags/fiels_diag.dart';
import 'package:provider/provider.dart';
import 'ListViews/Fillier_ListView.dart';

class Field extends StatefulWidget {
  const Field({Key? key}) : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  List<CraftModel>? craftList;
  List<CraftModel>? FilterList;
  CraftProvider craft=  CraftProvider();
  TextEditingController? searchkey = TextEditingController();
  void listcraft_getting() async {
    craftList = await CraftMethods.get_Craft();
    print(!craft.mycrafts);
    craft.mycrafts=true;
    print('l1l1l1 ${craftList![0]}');
  }

  @override
  void initState() {
    listcraft_getting();
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
            FilterList=craftList!.where((c) {

          var searchcrop=c.namecraft!.toLowerCase();
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
      value: craft,
      child: Consumer<CraftProvider>(
        builder: (build,craftmanager,_){
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
                                         Icon(Icons.home,size: 30,color: MyStyle.deepyellow,),
                                         SizedBox(width: 20,),
                                         Text(' Fillier Management ' ,style: MyStyle.LoginTitlestyle,)
                                       ],
                                     )
                                     ,
                                   ),
                                 ),
                                 //SizedBox(width: 30,),
                                 search( width),
                                 GestureDetector(

                                     onTap: (){

                                       showDialog(
                                           barrierDismissible: false,
                                           barrierColor: Colors.transparent,
                                           context: context, builder:(_)=> AddFields()).then((v)
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
                                     ))
                               ],
                             ),
                           ),
                           SizedBox(height: 30,),
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
                             child: Row(
                               children:  [
                                 Text('Les Filliers Existeess',style: MyStyle.LoginTitlestyle,),

                                 Padding(
                                   padding: const EdgeInsets.only(top: 10.0,left: 20),
                                   child: Container(
                                       color: Colors.grey,
                                       height: 2,
                                       width: width*0.6,
                                       child: SizedBox()),
                                 ),
                               ],
                             ),
                           ),

                           SizedBox(
                             height: height*0.7,
                             width: width * 0.8,
                             //color: Colors.blue,
                             child: !craftmanager.mycrafts ?    Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children:const [
                                 CircularProgressIndicator(),
                                 SizedBox(height: 30,),
                                 Text('Loading ....')
                               ],
                             )


                             :craftList?.isEmpty ?? true ? const Center(child: Text('Il n existe Rien'))

                             :GridView.builder(
                               //scrollDirection: Axis.horizontal,
                               itemCount: searchkey!.text.isNotEmpty ? FilterList!.length : craftList?.length,
                               itemBuilder: (BuildContext context , int index){

                                 return FilierItemList(caft: searchkey!.text.isNotEmpty ? FilterList![index]: craftList![index],);
                               },
                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 5,
                                 // crossAxisSpacing: 3.0,
                                 //mainAxisSpacing:1.0,
                               ),),),

                           SizedBox(height: 30,),



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