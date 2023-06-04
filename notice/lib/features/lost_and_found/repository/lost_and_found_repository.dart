import 'package:bloc_test/features/lost_and_found/data_provider/lost_and_found_data_provider.dart';
import 'package:bloc_test/features/lost_and_found/models/found_items_model.dart';
import 'package:bloc_test/features/lost_and_found/models/lost_items_model.dart';

import '../data_provider/found_local_database_provider.dart';
import '../data_provider/lost_local_database_data_provider.dart';

class LostAndFoundRepository {
  final LostAndFoundDataProvider dataProvider;
  final LostDatabaseProvider lostDatabaseProvider;
  final FoundDatabaseProvider foundDatabaseProvider;
  LostAndFoundRepository(this.dataProvider, this.lostDatabaseProvider, this.foundDatabaseProvider);

  Future<LostItem> createLostItem(lostItem) async {
    return await dataProvider.createLostItems(lostItem);
  }

  Future<FoundItem> createFoundItem(foundItem) async {
    return await dataProvider.createFoundItem(foundItem);
  }

  Future<List<LostItem>> fetchAllLostItems(page, filter) async {
    return await dataProvider.getLostItems(page, filter);
  }

  Future<List<FoundItem>> fetchAllFoundItems(page, filter) async {
    return await dataProvider.getFoundItems(page, filter);
  }

  Future<void> deleteFoundItem(foundItem) async {
    dataProvider.deleteFoundItem(foundItem);
  }

  Future<void> deleteLostItem(lostItem) async {
    dataProvider.deleteFoundItem(lostItem);
  }



  Future<void> createLostItemFromLocal(lostItem) async {
     lostDatabaseProvider.insertLostItems(lostItem);
  }
  Future<List<LostItem>> fetchAllLostItemsFromLocal() async {
    return await lostDatabaseProvider.getLostItems();
  }

   Future<void> deleteLostItemFromLocal() async {
    lostDatabaseProvider.deleteAllItems();
  }
  Future<void> openLostDatabase() async {
     lostDatabaseProvider.initializeDatabase();
  }
  Future<void> closeLostDatabase() async {
     lostDatabaseProvider.closeDatabase();
  }


  Future<void> createFoundItemfromLocal(foundItem) async {
     await foundDatabaseProvider.insertAllFoundItems(foundItem);
  }
  Future<List<FoundItem>> fetchAllFoundItemsFromLocal() async {
    return await foundDatabaseProvider.getFoundItems();
  }
  Future<void> deleteFoundItemFromLocal() async {
    foundDatabaseProvider.deleteAllFoundItems();
  }
   Future<void> openFoundDatabase() async {
     foundDatabaseProvider.initializeDatabase();
  }
  Future<void> closeFoundDatabase() async {
     foundDatabaseProvider.closeDatabase();
  }
}
