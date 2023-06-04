
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/found_items_model.dart';
class FoundDatabaseProvider {
  Database? _database;

  Future<void> initializeDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'found_item_database.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE found_items('
          'id TEXT PRIMARY KEY, '
          'title TEXT, '
          'description TEXT, '
          'category TEXT, '
          'imageUrl TEXT, '
          'userId TEXT, '
          'userName TEXT, '
          'userPicturePath TEXT, '
          'location TEXT, '
          'userAddress TEXT, '
          'claimQuestions TEXT, '
          'claimQuestionAnswers TEXT'
          ')',
        );
      },
    );
  }

  Future<void> insertFoundItem(FoundItem item) async {
    await _database!.insert(
      'found_items',
      item.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAllFoundItems(List<FoundItem> items) async {
    final batch = _database!.batch();

    for (final item in items) {
      batch.insert(
        'found_items',
        item.toSqlMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  Future<List<FoundItem>> getFoundItems() async {
    final List<Map<String, dynamic>> maps = await _database!.query('found_items');

    return List.generate(maps.length, (index) {
      return FoundItem.fromMap(maps[index]);
    });
  }

  Future<void> updateFoundItem(FoundItem item) async {
    await _database!.update(
      'found_items',
      item.toSqlMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<void> deleteFoundItem(int id) async {
    await _database!.delete(
      'found_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllFoundItems() async {
    await _database!.delete('found_items');
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
