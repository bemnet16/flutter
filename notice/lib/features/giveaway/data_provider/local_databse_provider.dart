import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/giveaway_model.dart';
class GiveawayDatabaseProvider {
  Database? _database;

  Future<void> initializeDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = join(path, 'giveaway_database.db');

    _database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) {
        return db.execute(
          'CREATE TABLE giveaways('
          'id TEXT PRIMARY KEY, '
          'title TEXT, '
          'description TEXT, '
          'category TEXT, '
          'condition TEXT, '
          'imageUrl TEXT, '
          'userId INTEGER, '
          'userPicturePath TEXT, '
          'isAvailable TEXT, '
          'userName TEXT'
          ')',
        );
      },
    );
  }

  Future<void> insertGiveaway(Giveaway giveaway) async {
    await _database!.insert(
      'giveaways',
      giveaway.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAllGiveaways(List<Giveaway> giveaways) async {
    final batch = _database!.batch();

    for (final giveaway in giveaways) {
      batch.insert(
        'giveaways',
        giveaway.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  Future<Giveaway?> getGiveawayById(String id) async {
    final List<Map<String, dynamic>> maps = await _database!.query(
      'giveaways',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Giveaway.fromMap(maps.first);
    }

    return null;
  }

  Future<List<Giveaway>> getGiveaways() async {
    final List<Map<String, dynamic>> maps = await _database!.query('giveaways');

    return List.generate(maps.length, (index) {
      return Giveaway.fromMap(maps[index]);
    });
  }

  Future<void> deleteAllGiveaways() async {
    await _database!.delete('giveaways');
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
