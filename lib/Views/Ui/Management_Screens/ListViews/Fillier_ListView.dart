

import 'package:flutter/material.dart';
import 'package:project/Models/CraftModel.dart';
import 'package:project/Helper/Theme/MyStyle.dart';
import 'package:project/ViewModel/Methods/CraftMethods.dart';
import 'package:project/Views/Ui/DeleteingDiag/Delete_Diag.dart';

class FilierItemList extends StatefulWidget {
  CraftModel? caft;
  FilierItemList({Key? key,this.caft}) : super(key: key);

  @override
  _FilierItemListState createState() => _FilierItemListState();
}


class _FilierItemListState extends State<FilierItemList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 50,
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
              Text(widget.caft!.namecraft!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),

            ],
          ),
        ));
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
                CraftMethods.Delete_Craft(widget.caft!.idcraft!);

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: MyStyle.deepyellow,
                  content:  Text("Supprimer"),));

              },
              child: const Text('Supprimer')), value: '1'),
      PopupMenuItem<String>(
          child: const Text('Modifier'), value: '2'),


    ],
      // other code as above
    );
  }
}
