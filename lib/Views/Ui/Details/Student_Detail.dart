import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/Models/Month.dart';
import 'package:project/ViewModel/Methods/MonthsMethods.dart';
import 'package:project/Views/Provider/Home_Provider.dart';
import 'package:project/Views/Provider/Month_Provider.dart';
import 'package:provider/provider.dart';

import '../../../Models/Student_Model.dart';

class StudentDetail extends StatefulWidget {
  StudentModel? student;
  int ? duration;

  StudentDetail({Key? key,this.student,this.duration}) : super(key: key);


  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  final allchecked=CheckBoxModel(title: 'All Checked');
  final checkboxlist = [
  CheckBoxModel(title: 'Seance 1'),
  CheckBoxModel(title: 'Seance 2'),
  CheckBoxModel(title: 'Seance 3'),
  CheckBoxModel(title: 'Seance 4'),
  CheckBoxModel(title: 'Paiment')
  ];
  bool first_seance = false;
  bool second=false;
  List<bool> choice=[false,true];
  List<int> groupValue = [];
  List<List<int>> value = [];
  Color initialColor=Colors.grey;


  List<MonthModel>? mthList;
  List<List<bool>> SeanceList=[];
  List<bool> Seance1=[];
  List<List<bool>> Seance2List=[];
  List<bool> Seance2=[];
  List<List<bool>> Seance3List=[];
  List<bool> Seance3=[];
  List<List<bool>> Seance4List=[];
  List<bool> Seance4=[];
  List<List<bool>> payList=[];
  List<bool> pay=[];
  MonthProvider monthmanage= MonthProvider();
  void listmth_getting() async
  {
    mthList = await MonthMethods.get_Month_ByGRpid(widget.student!.id!);
    monthmanage.mymonth=true;
    print('ggg $mthList');
    if(mthList!.isNotEmpty){
      print('jjjjjjjjjj');
      for(int j=0;j<mthList!.length;j++) {
        Seance1.add(MonthMethods.toBoolean(mthList![j].Seance1!));
        SeanceList.add(Seance1);
        Seance2.add(MonthMethods.toBoolean(mthList![j].Seance2!));
        Seance2List.add(Seance2);
        Seance3.add(MonthMethods.toBoolean(mthList![j].Seance3!));
        Seance3List.add(Seance3);
        Seance4.add(MonthMethods.toBoolean(mthList![j].Seance4!));
        Seance4List.add(Seance4);
        pay.add(MonthMethods.toBoolean(mthList![j].Payment!));
        payList.add(pay);

      }
      print('g1g1g1 ${SeanceList[1][1].toString()}');
    }
    print('g1g1g1 ${SeanceList.toString()}');
  }
  List<List<Color>> initial=[];
  List<List<bool>> initialvalue=[];
  @override
  void initState() {

    listmth_getting();
    
    for(int i=0;i<widget.duration!;i++)
    {
      initialvalue.add(List.filled(5, false, growable: false));
      initial.add(List.filled(5, Colors.grey, growable: false));


    }


   // initial = List.filled(widget.duration!, Colors.grey, growable: false);
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Center(child:const Text('Management des Apparents',style: MyStyle.LoginTitlestyle,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
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
              borderRadius: BorderRadius.circular(15)
          ),
          child: ChangeNotifierProvider.value(
            value: monthmanage,
            child: Consumer<MonthProvider>(
              builder: (context, manager,_){
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Nom D etudient (e):  ${widget.student!.fullname!}',style: MyStyle.LoginTitlestyle,) ),
                        ),

                        SizedBox(width: 20,),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20,top: 10),
                          child: Divider(),
                        ),
                        SizedBox(child: !manager.mymonth ?
                         Column(
                           mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:const [
                            CircularProgressIndicator(),
                            SizedBox(height: 30,),
                            Text('Loading ....')
                          ],
                        ):
                        mthList?.isEmpty ?? true ?

                         Align(
                           alignment: Alignment.center,
                             child: SizedBox(
                                 width: 300,
                                 height: 40,
                                 child: RaisedButton(
                                     color: MyStyle.deepyellow,
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(10)),


                                  onPressed: (){
                                    for(int i=0; i< widget.duration!; i++)
                                    {
                                      MonthMethods.Insert_Month(widget.student!.id!, 'false', 'false', 'false', 'false', 'false', 'false');
                                    }
                                    setState(() {
                                      initState();
                                    });


                                  },
                                  child: const Text('Start',style: MyStyle.addbuttonstyle,),
                        ),
                         ))


                        : ListView.builder(

                              shrinkWrap: true,
                              itemCount: mthList?.length,
                              itemBuilder: (BuildContext context ,int index){
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.width*0.055,
                                    width: MediaQuery.of(context).size.width,
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
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30.0,right: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: ListTile(

                                              leading: IconButton(
                                                icon: Icon(Icons.check,color: ( !SeanceList[index][index] ) ?  initial[index][0]: Colors.green,),
                                                onPressed: () {

                                                  setState(() {
                                                    print(' ray 1${SeanceList[index][index]}');

                                                    initialvalue[index][0]=!initialvalue[index][0];
                                                    SeanceList[index][index]=!SeanceList[index][index];

                                                    print(' ray ${SeanceList[index][index]}');

                                                  });

                                                },

                                              ),
                                              title: Text(checkboxlist[0].title!),
                                            ),
                                          ),
                                          Flexible(
                                            child: ListTile(
                                              leading: IconButton(
                                                icon: Icon(Icons.check,color: ( !Seance2List[index][index] )  ?  initial[index][0]: Colors.green,),
                                                onPressed: () {

                                                  setState(() {
                                                    initialvalue[index][1]=!initialvalue[index][1];
                                                    Seance2List[index][index]=!Seance2List[index][index];
                                                  });

                                                },

                                              ),
                                              title: Text(checkboxlist[1].title!),
                                            ),
                                          ),
                                          Flexible(
                                            child: ListTile(

                                              leading: IconButton(
                                                icon: Icon(Icons.check,color: ( !Seance3List[index][index] ) ?  initial[index][0]: Colors.green,),
                                                onPressed: () {

                                                  setState(() {
                                                    initialvalue[index][2]=!initialvalue[index][2];
                                                    Seance3List[index][index]=!Seance3List[index][index];
                                                  });

                                                },

                                              ),
                                              title: Text(checkboxlist[2].title!),
                                            ),
                                          ),
                                          Flexible(
                                            child: ListTile(

                                              leading: IconButton(
                                                  icon: Icon(Icons.check,color: ( !Seance4List[index][index] ) ?  initial[index][0]: Colors.green,),
                                                  onPressed: () {

                                                    setState(() {
                                                      initialvalue[index][3]=!initialvalue[index][3];
                                                      Seance4List[index][index]=!Seance4List[index][index];
                                                    });

                                                  },

                                              ),
                                              title: Text(checkboxlist[3].title!),
                                            ),
                                          ),
                                          Flexible(
                                            child: ListTile(

                                             leading: IconButton(
                                               icon: Icon(Icons.check,color:( !payList[index][index]) ?  initial[index][0]: Colors.green,),
                                               onPressed: () {

                                                 setState(() {
                                                   initialvalue[index][4]=!initialvalue[index][4];
                                                   payList[index][index]=!payList[index][index];
                                                 });

                                               },

                                              ),
                                              title: Text(checkboxlist.last.title!),
                                            ),
                                          ),


                                          Flexible(
                                            child: RaisedButton(
                                              color: MyStyle.deepyellow,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10)),

                                              onPressed: (){

                                                MonthMethods.Update_Month(mthList![index].id!,widget.student!.id!, SeanceList[index][index].toString(), Seance2List[index][index].toString(), Seance3List[index][index].toString(), Seance4List[index][index].toString(), payList[index][index].toString());
                                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                  backgroundColor: MyStyle.deepyellow,
                                                  content:  Text("Les informations sont bien Ajoutee"),
                                                ));                                          },

                                              child:Text('  Enregistrer  ',style: MyStyle.addbuttonstyle2,)
                                            )
                                          ),
                                          SizedBox(width: 20,),
                                          Flexible(
                                              child: RaisedButton(

                                                  color: MyStyle.deepyellow,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)),

                                                  onPressed: (){
                                                     },

                                                  child:Text(' Impprimer ',style: MyStyle.addbuttonstyle2,)
                                              )
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              },

            ),
          )
        ),
      ),
    );
  }
}

class CheckBoxModel{
  String? title;
  bool? value;


  CheckBoxModel({@required this.title,this.value=false}) ;

}
