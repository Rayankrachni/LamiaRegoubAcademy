import 'package:flutter/material.dart';
import 'package:project/Models/Groupe_Model.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/Views/Ui/Details/Groupe_Detail.dart';

import '../../../../ViewModel/Methods/GroupeMethods.dart';

class GroupeItemList extends StatefulWidget {
  GroupeModel? group;
  int? index;
  GroupeItemList({Key? key,this.group,this.index}) : super(key: key);


  @override
  _GroupeItemListState createState() => _GroupeItemListState();
}

class _GroupeItemListState extends State<GroupeItemList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> GroupeDetails(group: widget.group,index:widget.index)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 1,
                      spreadRadius:1,
                      offset: Offset(0,1)
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
            ),
            child:Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment:Alignment.topLeft,
                  child: GestureDetector(
                    onTapDown: (detail) => showPopUpMenuAtPosition(context,detail),
                    child: Container(
                      //  onPressed: () => showPopUpMenuAtPosition(context),

                        child: Icon(Icons.more_vert,size: 17,)),
                  )),
            ),
                  const CircleAvatar(
                    backgroundColor: MyStyle.muted,
                    backgroundImage: AssetImage('Assets/grp.png'),radius: 23,),
                  SizedBox(height: 10,),
                  Text('Groupe ${widget.index.toString()} ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  Text('Category Name ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(widget.group!.time!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)

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

                GroupMethods.Delete_Groupe(widget.group!.id!);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: MyStyle.deepyellow,
                  content:  Text("Les informations sont bien Ajoutee"),
                ));
              },
              child: const Text('Supprimer')), value: '1'),
      PopupMenuItem<String>(
          child: const Text('Modifier'), value: '2'),


    ],
      // other code as above
    );
  }
}
