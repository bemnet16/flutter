

import '../data_provider/notice_data_provider.dart';
import '../model/notice_model.dart';

class NoticeRepository {
  final NoticeDataProvider dataProvider;
  NoticeRepository(this.dataProvider);

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
}
