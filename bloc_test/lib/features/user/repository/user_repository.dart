import 'package:bloc_test/features/user/models/giveaway_model.dart';
import '../data_provider/user_data_provider.dart';
import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> fetchUser(id) async {
    return dataProvider.getUser(id);
  }

  Future<User> updateUser(user) async {
    return dataProvider.update(user);
  }

  Future<List<Giveaway>> fetchGiveaway(id) async {
    return dataProvider.getGiveaway(id);
  }

  Future<List<LostItem>> fetchLostItem(id) async {
    return dataProvider.getLostItems(id);
  }

  Future<List<FoundItem>> fetchFoundItem(id) async {
    return dataProvider.getFoundItems(id);
  }

  Future<void> delete(user) async {
    dataProvider.delete(user);
  }
}
