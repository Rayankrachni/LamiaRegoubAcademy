class StudentModel{

  final int? id;
  final int? idgroup;
  final String? fullname;


  StudentModel({this.id,this.idgroup,this.fullname});

  factory StudentModel.fromMap(Map<String, dynamic> json) =>StudentModel(
    id: json['id'],
    idgroup: json['idgroup'],
    fullname: json['fullname'],
  );

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'idgroup': idgroup,
      'fullname': fullname,

    };
  }

  @override
  String toString(){
    return 'Groupe{id: $id,idgroup:$idgroup,fullname:$fullname}';
  }

}