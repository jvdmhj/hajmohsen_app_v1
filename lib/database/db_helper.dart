import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _database;

   static Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await initDb();
    return _database! ;
   }

   static Future<Database> initDb() async{
    final dbpath=await getDatabasesPath();
    final path=join(dbpath,'haj_mohsen');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db , version)async{
       await db.execute(
          'CREATE TABLE haj_mohsen(id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT UNIQUE,password TEXT,phone INTEGER)'
        );
      }
    );
   }
static Future<bool> insertuser(String username, String password) async {
  final db = await database;

  try {
    await db.insert(
      'haj_mohsen',
      {
        'username': username,
        'password': password,
      },
    );
    return true;   
  } catch (e) {
    return false;
  }
}

     static Future<Map<String, dynamic>?> getUser(
      String username, String password) async {
    final db = await database;

    final result = await db.query(
      'haj_mohsen',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
  static Future<Map<String, dynamic>?> getByUserName(String username) async {
  final db = await database;

  final result = await db.query(
    'haj_mohsen',
    where: 'username = ?',
    whereArgs: [username],
  );

  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}
}