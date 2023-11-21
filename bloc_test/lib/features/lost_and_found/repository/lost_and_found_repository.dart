import 'package:bloc_test/features/lost_and_found/data_provider/lost_and_found_data_provider.dart';
import 'package:bloc_test/features/lost_and_found/models/found_items_model.dart';
import 'package:bloc_test/features/lost_and_found/models/lost_items_model.dart';

class LostAndFoundRepository {
  final LostAndFoundDataProvider dataProvider;
  LostAndFoundRepository(this.dataProvider);

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
}
