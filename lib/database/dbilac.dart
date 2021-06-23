import 'dart:async';

import 'package:path/path.dart';
import 'package:saglikcim/model/ilac.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper{
  static Database _dbi;

  Future<Database> get dbi async{
    if(_dbi!=null) return _dbi;
    _dbi=await initDb();
    return _dbi;
  }
  initDb()async{
    var dbFolderi =await getDatabasesPath();
    String pathi=join(dbFolderi,'Ilaclar.db');

    return await openDatabase(pathi,onCreate:_onCreate,version: 1);

  }

  FutureOr<void> _onCreate(Database dbi, int version) async{
    await dbi.execute("CREATE TABLE Ilaclar(id INTEGER PRIMARY KEY,vakit TEXT,ad TEXT,adet TEXT)");
  }

  Future<List<Ilac>> getIlac() async{
    var dbClient =await dbi;
    var result =await dbClient.query("Ilaclar",orderBy:"vakit");
    return result.map((data) => Ilac.fromMap(data)).toList();
  }

  Future<int> insertIlac(Ilac ilac)async{
    var dbClient =await dbi;
    return await dbClient.insert("Ilaclar", ilac.toMap());
  }

  Future<void> removeIlac(int id) async{
    var dbClient = await dbi;
    return await dbClient.delete("Ilaclar", where: "id=?", whereArgs: [id]);
  }

}