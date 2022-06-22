

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:project/Models/Student_Model.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/StudentMethods.dart';
import 'package:project/Views/Provider/Student_Provider.dart';
import 'package:provider/provider.dart';

class StudentItemList extends StatefulWidget {
  StudentModel? student;

  StudentItemList({Key? key,this.student}) : super(key: key);

  @override
  _StudentItemListState createState() => _StudentItemListState();
}


class _StudentItemListState extends State<StudentItemList> {



  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

        create: (_) =>  StudentProvider(),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            height: 50,
            decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Align(
                      alignment:Alignment.topLeft,
                      child: GestureDetector(
                        onTapDown: (detail) => showPopUpMenuAtPosition(context,detail),
                        child: Container(
                        //  onPressed: () => showPopUpMenuAtPosition(context),

                         child: Icon(Icons.more_vert,size: 17,)),
                      )),
                  const CircleAvatar(
                    backgroundColor: MyStyle.muted,
                    backgroundImage: AssetImage('Assets/person.png'),radius: 27,),
                  SizedBox(height: 10,),
                  Text(widget.student!.fullname!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  Text('Category Name ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)

                ],
              ),
            )),
      ),
    );
  }

  showPopUpMenuAtPosition(BuildContext context,TapDownDetails details ) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ), items: [
      PopupMenuItem<String>(
          child: GestureDetector(
              onTap: (){
               StudentProvider manage = Provider.of<StudentProvider>(context);
                StudentMethods.Delete_Student(widget.student!.id!);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: MyStyle.deepyellow,
                  content:  SizedBox(
                      width: 100,
                      child: Text("Supprimmr"))
                  ,
                ));

                manage.delete=true;




              },
              child: const Text('Supprimer')), value: '1'),
              const PopupMenuItem<String>(
                   child: Text('Modifier'), value: '2'),


    ],
      // other code as above
    );
  }
}
