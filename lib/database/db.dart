import 'dart:async';
import 'package:saglikcim/model/doktor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper{
  static Database _db;

  Future<Database> get db async{
    if(_db!=null) return _db;
    _db=await initDb();
    return _db;
  }
  initDb()async{
    var dbFolder =await getDatabasesPath();
    String path=join(dbFolder,'Doktor.db');

    return await openDatabase(path,onCreate:_onCreate,version: 1);

  }

  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE Doktor(id INTEGER PRIMARY KEY,adsoyad TEXT,hastane TEXT,bolum TEXT)");
  }

  Future<List<Doktor>> getDoktor() async{
    var dbClient =await db;
    var result =await dbClient.query("Doktor",orderBy:"adsoyad");
    return result.map((data) => Doktor.fromMap(data)).toList();
  }

  Future<int> insertDoktor(Doktor doktor)async{
    var dbClient =await db;
    return await dbClient.insert("Doktor", doktor.toMap());
  }

  Future<void> removeDoktor(int id) async{
    var dbClient = await db;
    return await dbClient.delete("Doktor", where: "id=?", whereArgs: [id]);
  }

}
