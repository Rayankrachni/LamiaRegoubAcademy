import 'package:flutter/material.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _UserName;
  TextEditingController? _Password;

  @override
  void initState() {
    // TODO: implement initState
    _UserName= new TextEditingController();
    _Password= new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Row(children: [

          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 40,left: 25),
            child: Container(
              height: height*0.6 ,
              width: width*0.4,

              decoration: const BoxDecoration(
                //color: Colors.yellow,
                image: DecorationImage(
                    image: AssetImage('Assets/lamiaregoub.png'),
                    fit: BoxFit.fill,

              ),
            ),
          )),
          SizedBox(width: 30,),
          Container(
            color: Colors.yellow.withOpacity(0.05),
            height: height*0.7 ,
            width: width*0.45,
            child: Padding(
              padding: EdgeInsets.only(top: 100,left: 30,right: 30),
              child: Column(
                children: [
                  Text('Welcome to Work Manager',style: MyStyle.LoginTitlestyle,),
                  SizedBox(height: 30,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller:_UserName,
                          validator: (value){
                            if(value==null || value.isEmpty)
                            {
                              return 'Remlir les zonnes';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(

                            hintText: 'User Name',
                            suffixIcon: Icon(Icons.code ,size: 17,),
                            hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),

                          ),
                        ),
                        SizedBox(height:25,),
                        TextFormField(
                          controller:_Password,
                          validator: (value){
                            if(value==null || value.isEmpty)
                            {
                              return 'Remlir les zonnes';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Pass Word',
                            hintStyle: TextStyle(color: MyStyle.muted,fontWeight: FontWeight.w600,fontSize: 13),
                            suffixIcon: Icon(Icons.lock ,size: 17,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),

                          ),
                        ),
                        SizedBox(height: 25,),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: width,
                    height: 50,

                    child: RaisedButton(
                      disabledColor: Colors.grey,
                      color: MyStyle.deepyellow,
                      onPressed: ()
                      {
                        if(_formKey.currentState!.validate())
                        {
                          if(_UserName!.text=='lala' && _Password!.text=='lala')
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'nnn',)));

                            }



                          //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('pro')));
                        }

                      },
                      child: const Text('Connection',style: MyStyle.buttonstyle,),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )

                ],
              ),
            ),
          )


        ],),
      ),
    );
  }
}
