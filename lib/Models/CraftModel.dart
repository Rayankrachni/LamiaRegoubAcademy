
import 'package:flutter/material.dart';

class CraftModel{

  final int? idcraft;
  final String? namecraft;
  final String? dmy;
  final int? duration;
  final double? price;

  CraftModel({this.idcraft,this.namecraft,this.duration,this.price,this.dmy});

  factory CraftModel.fromMap(Map<String, dynamic> json) => CraftModel(
      idcraft: json['id'] ,
      namecraft: json['fullname'] ,
      duration:json['Duration'] ,
      price: json['prix'],
      dmy: json['dmy'],
  );

  Map<String , dynamic> toMap(){
    return {
      'id': idcraft,
      'fullname': namecraft,
      'Duration': duration,
      'prix': price,
      'dmy': dmy,


    };
  }
  @override
  String toString(){
    return 'craft{id: $idcraft,fullname:$namecraft,Duration:$duration,prix:$price,dmy:$dmy}';
  }

}