import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
class ConnectionSqlServices {

  ConnectionSqlServices._();

  static  ConnectionSqlServices? _instance;

  static  ConnectionSqlServices get  instance{
    _instance ??= ConnectionSqlServices._();

    return _instance!;
  }

  static const DB_NAME='LamiaRegoub';
  static const DB_VERSION=2;
  Database? _db;
  Future<Database> get db=> openDatabase();
  Future<Database> openDatabase () async {
  sqfliteFfiInit();
  String databasePath= await databaseFactoryFfi.getDatabasesPath();
  String path= join(databasePath,DB_NAME);

  DatabaseFactory databaseFactory=databaseFactoryFfi;
  _db ??= await databaseFactory.openDatabase(path,options: OpenDatabaseOptions(
      onCreate: _Oncreate,
      version: DB_VERSION
    ));
  return _db!;
  }

  _Oncreate(Database db, int version) async{
    print('on create ');
    db.execute('''CREATE TABLE User (
    "id" INTEGER PRIMARY KEY, 
    "full_name" TEXT,
    "phone" INTEGER,
    "password" TEXT
   
  
    )''');

    db.execute('''CREATE TABLE craft (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "fullname" TEXT,
      "Duration" INTEGER,
      "prix" DOUBLE,
      'dmy' TEXT

      )''');

    db.execute('''CREATE TABLE collection (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "idcraft" INTEGER,
      "Date" TEXT,
      "Time" TEXT,
      "prof" TEXT
      )''');
    db.execute('''CREATE TABLE student (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "fullname" TEXT,
      "idgroup" INTEGER
      )''');
    db.execute('''CREATE TABLE bill (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "idstudent" INTEGER,
      "date" TEXT,
      "price" INTEGER,
      "month" TEXT
    
      )''');

    db.execute('''CREATE TABLE monthmange (
      "id" INTEGER PRIMARY KEY AUTOINCREMENT, 
      "idstudent" INTEGER,
      "Seance1" TEXT,
      "Seance2" TEXT,
      "Seance3" TEXT,
      "Seance4" TEXT,
      "Payment" TEXT
      )''');




  }

  readDatabase(String sql) async {
    Database? mydb= await db;
    List<Map> response=await mydb.rawQuery(sql);
    return response;

  }

  readDatabasebyvalue(String sql, List<Object> value) async {
    Database? mydb= await db;
    List<Map> response=await mydb.rawQuery(sql,value);
    return response;

  }

  getonerow(String table, dynamic value, String Column) async {
    Database? mydb= await db;
    List<Map> response=await mydb.query(table,where: '$Column = $value');
    return response;

  }




  insertDatabase(String sql, List<Object> list) async {
    Database? mydb= await db;
    int response= await mydb.rawInsert(sql,list);
    return response;

  }
  updateDatabase(String sql, List<Object> list) async {
    Database? mydb= await db;
    int response=await mydb.rawUpdate(sql,list);
    return response;

  }
  deleteDatabase(String sql) async {
    Database? mydb= await db;
    int response=await mydb.rawDelete(sql);
    return response;

  }
}