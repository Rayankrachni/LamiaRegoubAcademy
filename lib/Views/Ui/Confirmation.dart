import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/Views/Ui/Management_Screens/Home.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {


  @override
  void initState() {

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

                        SizedBox(height:20),


                        const SizedBox(height:20),

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

                                onTap: (){


                                },


                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width*0.14,
                                      height: 40,
                                      decoration: BoxDecoration(

                                        // color: MyStyle.deepyellow,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Center(child: Text('Ajouter',style: MyStyle.addbuttonstyle1,))),
                                ))
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
  }
}
