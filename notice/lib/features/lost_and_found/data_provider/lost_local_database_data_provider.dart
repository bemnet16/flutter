
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/lost_items_model.dart';
class LostDatabaseProvider {
  Database? _database;
  Future<void> initializeDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'feature_database.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE lost_items('
          'id TEXT PRIMARY KEY, '
          'title TEXT, '
          'description TEXT, '
          'category TEXT, '
          'imageUrl TEXT, '
          'userAddress TEXT, '
          'userId TEXT, '
          'userName TEXT, '
          'userPicturePath TEXT, '
          'location TEXT'
          ')',
        );
      },
    );
  }
  Future<void> insertLostItem(LostItem item) async {
    await _database!.insert(
      'lost_items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> insertLostItems(List<LostItem> items) async {
  final batch = _database!.batch();

  for (final item in items) {
    batch.insert(
      'lost_items',
      item.toMapForSql(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  await batch.commit();
}

  Future<List<LostItem>> getLostItems() async {
    final List<Map<String, dynamic>> maps = await _database!.query('lost_items');
    return List.generate(maps.length, (index) {
      return LostItem.fromSqlMap(maps[index]);
    });
  }

  Future<void> updateLostItem(LostItem item) async {
    await _database!.update(
      'lost_items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteLostItem(int id) async {
    await _database!.delete(
      'lost_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllItems() async {
    await _database!.delete('lost_items');
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
