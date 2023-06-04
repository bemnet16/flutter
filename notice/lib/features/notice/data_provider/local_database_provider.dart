import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/notice_model.dart';

class DatabaseProvider {
  Database? _database;

  Future<void> initializeDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'notice_database.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE notices('
          'id TEXT PRIMARY KEY, '
          'title TEXT, '
          'content TEXT, '
          'author TEXT, '
          'visibility TEXT, '
          'year INTEGER, '
          'typeOfProgram TEXT, '
          'userId TEXT, '
          'department TEXT, '
          'imgUrl TEXT, '
          'attachmentUrl TEXT, '
          'tags TEXT'
          ')',
        );
      },
    );
   
    
  }

  Future<void> insertNotice(Notice notice) async {
    await _database!.insert(
      'notices',
      notice.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertNotices(List<Notice> notices) async {
    final batch = _database!.batch();
    for (final notice in notices) {
      batch.insert(
        'notices',
        notice.toSqlMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }

  Future<List<Notice>> getNotices() async {
    final List<Map<String, dynamic>> maps = await _database!.query('notices');

    return List.generate(maps.length, (index) {
      return Notice.fromSqlMap(maps[index]);
    });
  }

  Future<void> deleteAllFoundItems() async {
    await _database!.delete('notices');
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
