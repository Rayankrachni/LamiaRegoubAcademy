
class GroupeModel{

  final int? id;
  final int? idcraft;
  final String? time;
  final String? hour;
  final String? prof;


  GroupeModel({this.id,this.idcraft,this.time,this.prof,this.hour});

  factory GroupeModel.fromMap(Map<String, dynamic> json) =>GroupeModel(
    id: json['id'],
    idcraft: json['idcraft'],
    time: json['Date'],
    prof: json['prof'],
    hour:json['Time'],

  );

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'idcraft': idcraft,
      'Date': time,
      'prof':prof,
      'Time':hour

    };
  }

  @override
  String toString(){
    return 'collection{id: $id,idcraft:$idcraft,Date:$time,prof:$prof,Time:$hour}';
  }





}