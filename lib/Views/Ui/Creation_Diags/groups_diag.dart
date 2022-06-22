import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/Models/CraftModel.dart';
import 'package:project/ViewModel/API/Craft_ViewModel.dart';
import 'package:project/ViewModel/API/Group_ViewModel.dart';
import 'package:project/ViewModel/API/Student_ViewModel.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/ViewModel/Methods/GroupeMethods.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../Provider/Fillier_Provider.dart';

class Add_Group extends StatefulWidget {
  const Add_Group({Key? key}) : super(key: key);

  @override
  _Add_GroupState createState() => _Add_GroupState();
}

class _Add_GroupState extends State<Add_Group> {

  TextEditingController? _date_controller , _prof_controller ,_fillier_controller ,_time_controller ;

  String? _currentSelectedValue;

  String? _currentFillierSelectedValue;

  List<CraftModel>? craftList;

  List<String> craftNames = List<String>.empty(growable: true);

  String get date => _date_controller!.text;

  String get prof => _prof_controller!.text;

  String get hour => _prof_controller!.text;

  List<String> Days=['Saturday','Sunday','Monday','Tuesday','Wednesday','Thursday','Friday'] ;

  List<String> geting = List<String>.empty(growable: true);

  int get idcraft => int.parse(_fillier_controller!.text);


  // Sunday

  CraftProvider craft=  CraftProvider();
  void listcraft_getting() async {
    craftList = await CraftMethods.get_Craft();
    print(!craft.mycrafts);
    print("llllllllllllll$craftList");
    craft.mycrafts=true;
    print('l1l1l1 ${craftList![0]}');

    geting=CraftMethods.FiellierName(craftList!, craftNames)!;
   // print(DateFormat('EEEE').format(dayss));
  }

  @override
  void initState() {

    listcraft_getting();
    // TODO: implement initState
    _prof_controller=new TextEditingController();
    _date_controller=new TextEditingController();
    _fillier_controller= new TextEditingController();
    _time_controller=new TextEditingController();

    print(geting);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: craft,
      child: Consumer<CraftProvider>(
        builder: (context, manager,_){
          return Scaffold(      backgroundColor: Colors.grey.withOpacity(0.5),
              body:AlertDialog(
                elevation: 0,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(15.0))),
                content: Builder(
                    builder: (context)
                    { return !manager.mycrafts ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const [
                        CircularProgressIndicator(),
                        SizedBox(height: 30,),
                        Text('Loading ....')
                      ],
                    ) : craftList!.isEmpty ? const Center(child: Text('Il n existe Rien'))

                    :Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width:MediaQuery.of(context).size.width*0.45 ,
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
                                //fillier+++++++++++++++++++++
                                Container(
                                  padding: EdgeInsets.only(left: 4,right: 4),
                                  decoration: BoxDecoration(

                                    //    color: MyStyle.deepyellow,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: FormField<String>(

                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          //labelStyle: textStyle,
                                            fillColor: Colors.white,
                                            label: Text('Fillier'),
                                            enabledBorder:const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            disabledBorder:const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            errorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            focusedErrorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              // borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                            hintText: 'Please select expense',
                                            hintStyle: TextStyle(color: Colors.black12),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                                        isEmpty: _currentFillierSelectedValue == 'Fillier',
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: _currentFillierSelectedValue,
                                            isDense: true,
                                            onChanged: ( newValue) {
                                              setState(() {
                                                _currentFillierSelectedValue = newValue;
                                                state.didChange(newValue);
                                              });
                                            },
                                            items: geting.map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                /*TextFormField(
                              controller: _fillier_controller,
                              decoration: const InputDecoration(
                                label:Text('Fillier'),
                                labelStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 11),
                                //hintText: 'Fillier',
                               // hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                                suffixIcon: Icon(Icons.lock ,size: 17,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),

                              ),
                            ),*/
                                SizedBox(height:20),
                                //Time
                                TextFormField(
                                  controller: _prof_controller,
                                  decoration: const InputDecoration(
                                    // hintText: 'Prof',
                                    label:Text('prof'),
                                    labelStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 11),

                                    // hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                                    suffixIcon: Icon(Icons.lock ,size: 17,),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),

                                  ),
                                ),
                                SizedBox(height:20),
                                TextFormField(

                                  controller:_date_controller ,
                                  decoration: const InputDecoration(
                                    //   hintText: 'Date',
                                    label:Text('Date'),

                                    labelStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 11),

                                    //  hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                                    suffixIcon: Icon(Icons.lock ,size: 17,),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),

                                  ),
                                ),
                                SizedBox(height:20),
    /*  TextFormField(
                                  controller:_time_controller ,
                                  decoration: const InputDecoration(
                                    // hintText: 'Time',
                                    label:Text('Time'),
                                    labelStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 11),

                                    //   hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                                    suffixIcon: Icon(Icons.lock ,size: 17,),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),

                                  ),
                                ),
                                TextFormField(

                              decoration: const InputDecoration(
                                hintText: 'Duree',
                                hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                                suffixIcon: Icon(Icons.lock ,size: 17,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),

                              ),
                            ),
                           */
                                SizedBox(height:20),

                                Container(
                                  padding: EdgeInsets.only(left: 4,right: 4),
                                  decoration: BoxDecoration(

                                    //    color: MyStyle.deepyellow,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: FormField<String>(

                                    builder: (FormFieldState<String> state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                          //labelStyle: textStyle,
                                            fillColor: Colors.white,
                                            label: Text('Day'),
                                            enabledBorder:const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            disabledBorder:const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            errorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            focusedErrorBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              // borderSide:  BorderSide(color: Colors.grey, width: 0.0),
                                            ),
                                            errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                            hintText: 'Please select expense',
                                            hintStyle: TextStyle(color: Colors.black12),
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                                        isEmpty: _currentSelectedValue == 'Day',
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: _currentSelectedValue,
                                            isDense: true,
                                            onChanged: ( newValue) {
                                              setState(() {
                                                _currentSelectedValue = newValue;
                                                print('_currentSelectedValue$_currentSelectedValue');
                                                state.didChange(newValue);
                                              });
                                            },
                                            items: Days.map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(

                                        onTap: (){
                                          CraftVM.getCraft();
                                          GroupVM.getGroups();
                                          StudentVM.getStudents();
                                          // Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                                width: MediaQuery.of(context).size.width*0.14,
                                                height: 40,
                                                decoration: BoxDecoration(

                                                  // color: MyStyle.deepyellow,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Center(child: Text('Annuller',style: MyStyle.addbuttonstyle1,))),
                                          ),
                                        )),
                                    GestureDetector(

                                        onTap: (){
                                          GroupMethods.Insert_Groupe(CraftMethods.Fiellierid(craftList,_currentFillierSelectedValue!)!, date, prof,_currentSelectedValue!);
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
                                              child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle1,))),
                                        )),

                                  ],
                                )

                              ],
                            ),
                          ),
                          Positioned(
                            top: - MediaQuery.of(context).size.width/25 +20,
                            right: -MediaQuery.of(context).size.width/29-32,
                            child: Container(
                              width : MediaQuery.of(context).size.width/10,
                              decoration: const BoxDecoration(
                                  color:Colors.red,
                                  shape: BoxShape.circle
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );}),
                )
            );
          },
        )





          );
        }
      }
