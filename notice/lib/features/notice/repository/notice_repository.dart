import '../data_provider/local_database_provider.dart';
import '../data_provider/notice_data_provider.dart';
import '../model/notice_model.dart';

class NoticeRepository {
  final NoticeDataProvider dataProvider;
  final DatabaseProvider databaseProvider;
  NoticeRepository(this.dataProvider,this.databaseProvider);

  Future<Notice> create(notice) async {
    return dataProvider.create(notice);
  }

  Future<Notice> update(notice) async {
    return dataProvider.update(notice);
  }

  Future<List<Notice>> fetchAll(page, filter) async {
    return dataProvider.getNotices(page, filter);
  }

  Future<void> delete(notice) async {
    dataProvider.delete(notice);
  }
  Future<void> open() async {
    databaseProvider.initializeDatabase();
  }
  Future<void> close() async {
    databaseProvider.closeDatabase();
  }
   Future<void> createFromLocal(notice) async {
    return databaseProvider.insertNotices(notice);
  }
  Future<List<Notice>> fetchAllFromLocal() async {
    return databaseProvider.getNotices();
  }
   Future<void> deleteFromLocal() async {
    databaseProvider.deleteAllFoundItems();
  }
}
