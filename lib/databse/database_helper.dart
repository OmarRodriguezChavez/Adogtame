import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
class DatabaseHelper {
  static final nameDB = 'Dogs';
  static final versionDB = 1;
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return await openDatabase(
      pathDB,
      version: versionDB,
      onCreate: _createTables,
    );
  }

  _createTables(Database db, int version) async {
    String query = '''CREATE TABLE tblBreed(
      id INTEGER PRIMARY KEY,
      bred_for VARCHAR(200),
      reference_image_id VARCHAR(250),
      name VARCHAR(100),
      origin VARCHAR(100))''';

    db.execute(query);
  }

  Future<int> INSERT( Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion.insert('tblBreed', data);
  }

  /*Future<int> UPDATE(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion
        .update(tblName, data, where: 'idPost=?', whereArgs: [data['idPost']]);
  }*/

 Future<int> DELETE(int id, String idColumnName) async {
    var conexion = await database;
    return await conexion.delete(
      'tblBreed',
      where: '$idColumnName = ?',
      whereArgs: [id],
    );
  }

 

  //Calendar events

  



  Future<bool> searchPopular(int id_popular) async {
    var conexion = await database;
    var query = "SELECT * FROM tblBreed where id=?";
    var result = await conexion.rawQuery(query, [id_popular]);
    if (result != null && result.isNotEmpty) {
      return true;
    }
    return false;
  }

  
}
