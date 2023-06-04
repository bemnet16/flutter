import '../data_provider/local_databse_provider.dart';
import '../data_provider/giveaway_data_provider.dart';
import '../model/giveaway_model.dart';

class GiveawayRepository {
  final GiveawayDataProvider dataProvider;
  final GiveawayDatabaseProvider giveawayDatabaseProvider;
  GiveawayRepository(this.dataProvider, this.giveawayDatabaseProvider);

  Future<Giveaway> create(giveaway) async {
    return await dataProvider.create(giveaway);
  }

  Future<Giveaway> update(giveaway) async {
    return await dataProvider.update(giveaway);
  }

  Future<List<Giveaway>> fetchAll(page, filter) async {
    return await dataProvider.getGiveaways(page, filter);
  }

  Future<void> delete(giveaway) async {
    dataProvider.delete(giveaway);
  }



 Future<void> createFromLocal(giveaway) async {
     await giveawayDatabaseProvider.insertAllGiveaways(giveaway);
  }
  Future<List<Giveaway>> fetchAllFromLocal() async {
    return await giveawayDatabaseProvider.getGiveaways();
  }
    Future<void> deleteFromLocal() async {
    giveawayDatabaseProvider.deleteAllGiveaways();
  }
  Future<void> open() async {
    giveawayDatabaseProvider.initializeDatabase();
  }
  Future<void> close() async {
    giveawayDatabaseProvider.initializeDatabase();
  }





}
