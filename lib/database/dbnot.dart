import 'dart:async';

import 'package:path/path.dart';
import 'package:saglikcim/model/nt.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper{
  static Database _dbn;

  Future<Database> get dbn async{
    if(_dbn!=null) return _dbn;
    _dbn=await initDb();
    return _dbn;
  }
  initDb()async{
    var dbFoldern =await getDatabasesPath();
    String pathn=join(dbFoldern,'Notlar.db');

    return await openDatabase(pathn,onCreate:_onCreate,version: 1);

  }

  FutureOr<void> _onCreate(Database dbn, int version) async{
    await dbn.execute("CREATE TABLE Notlar(id INTEGER PRIMARY KEY,nt TEXT)");
  }

  Future<List<Nt>> getNt() async{
    var dbClient =await dbn;
    var result =await dbClient.query("Notlar",orderBy:"id");
    return result.map((data) => Nt.fromMap(data)).toList();
  }

  Future<int> insertNt(Nt nt)async{
    var dbClient =await dbn;
    return await dbClient.insert("Notlar", nt.toMap());
  }
  Future<int> updateNt(Nt nt) async{
    var dbClient = await dbn;
    return await dbClient.update("Notlar", nt.toMap(), where: "id=?", whereArgs: [nt.id]);
  }

  Future<void> removeNt(int id) async{
    var dbClient = await dbn;
    return await dbClient.delete("Notlar", where: "id=?", whereArgs: [id]);
  }

}