
class MonthModel{

  final int? id;
  final int? idstd;
  final String? Seance1;
  final String? Seance2;
  final String? Seance3;
  final String? Seance4;
  final String? Payment;


  MonthModel({this.id,this.idstd,this.Seance1,this.Seance2,this.Seance3,this.Seance4,this.Payment});

  factory MonthModel.fromMap(Map<String, dynamic> json) =>MonthModel(
    id:json['id'],
    idstd: json['idstudent'],
    Seance1: json['Seance1'],
    Seance2: json['Seance2'],
    Seance3: json['Seance3'],
    Seance4: json['Seance4'],
    Payment: json['Payment'],

  );

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'idstudent': idstd,
      'Seance1': Seance1,
      'Seance2':Seance2,
      'Seance3': Seance3,
      'Seance4': Seance4,
      'Payment': Payment,

    };
  }

  @override
  String toString(){
    return 'monthmange{id: $id,idstudent:$idstd,Seance1:$Seance1,Seance2:$Seance2,Seance3:$Seance3,Seance4:$Seance4,Payment:$Payment}';
  }





}