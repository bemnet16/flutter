import '../data_provider/giveaway_data_provider.dart';
import '../model/giveaway_model.dart';

class GiveawayRepository {
  final GiveawayDataProvider dataProvider;
  GiveawayRepository(this.dataProvider);

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
}
