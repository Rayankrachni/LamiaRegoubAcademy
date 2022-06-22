import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/Views/Ui/Management_Screens/Fields.dart';
import 'package:project/Views/Ui/Management_Screens/Home.dart';

import '../Confirmation.dart';

class AddFields extends StatefulWidget {
  const AddFields({Key? key}) : super(key: key);

  @override
  _AddFieldsState createState() => _AddFieldsState();
}

class _AddFieldsState extends State<AddFields> {
  TextEditingController? _name_controller , _price_controller ,_duration_controller;

  List<String> DMY=['Mois','Jours','Annee'] ;


  String get fullname => _name_controller!.text;

  double get price => double.parse(_price_controller!.text);

  int get duration => int.parse(_duration_controller!.text);

  final _formKey = GlobalKey<FormState>();

  String? _currentSelectedValue;

  @override
  void initState() {
    _name_controller = new TextEditingController();
    _duration_controller= new TextEditingController();
    _price_controller =new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width:MediaQuery.of(context).size.width*0.4 ,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.width *0.01 ),
                          const Text(
                            'Ajouter une carft',
                            style: MyStyle.LoginTitlestyle,
                            textAlign: TextAlign.center,

                          ),
                          SizedBox(height:10),
                          TextFormField(
                            controller: _name_controller,
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return 'Entrer le nom du fillier et if faut doit etre unique';
                              }
                              return null;
                            },

                            decoration: const InputDecoration(
                              hintText: 'Nom',
                              hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                              suffixIcon: Icon(Icons.lock ,size: 17,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),

                            ),
                          ),
                          SizedBox(height:10),

                          TextFormField(
                            controller: _price_controller,
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return 'Entrer le prix de cette formation';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'price',

                              hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                              suffixIcon: Icon(Icons.lock ,size: 17,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),

                            ),
                          ),
                          const SizedBox(height:10),
                          TextFormField(
                            controller: _duration_controller,
                            validator: (value){
                              if(value==null || value.isEmpty)
                              {
                                return 'Entrer le nombre des mois ou des jours';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: 'duration',

                              hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                              suffixIcon: Icon(Icons.lock ,size: 17,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),

                            ),
                          ),
                          const SizedBox(height:10),
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
                                      items: DMY.map((String value) {
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
                          const SizedBox(height:20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(

                                 onTap: (){
                                   Navigator.pop(context,true);
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

                               onTap: () {
                                 if(_formKey.currentState!.validate())
                                 {

                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Field()));

                                   CraftMethods.Insert_Craft(fullname, duration, price,_currentSelectedValue!);
                                   Navigator.pop(context,true);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Field()));

                                   //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('pro')));
                                 }

                                },


                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width*0.14,
                                        height: 40,

                                        decoration: BoxDecoration(
                                            color: MyStyle.deepyellow,
                                          // color: MyStyle.deepyellow,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle,))),
                                  ))
                            ],
                          )

                        ],
                      ),
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
  }
}
