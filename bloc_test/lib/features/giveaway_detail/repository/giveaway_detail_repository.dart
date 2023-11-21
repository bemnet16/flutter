import 'package:bloc_test/features/giveaway_detail/models/essay_model.dart';
import 'package:bloc_test/features/giveaway_detail/models/giveaway_model.dart';

import '../data_provider/giveaway_detail_data_provider.dart';

class GiveawayDetailRepository {
  final GiveawayDataDetailProvider dataProvider;
  GiveawayDetailRepository(this.dataProvider);

  Future<Giveaway> fetch(id) async {
    return dataProvider.getGiveawaydetail(id);
  }

  Future<Essay> create(esasy) async {
    return dataProvider.createEssay(esasy);
  }

  Future<List<Essay>> fetchAllEssays(id) async {
    final essays = await dataProvider.getGiveawayEssay(id);
    return essays;
  }
}
