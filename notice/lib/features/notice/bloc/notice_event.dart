part of 'notice_bloc.dart';

abstract class NoticeEvent extends Equatable {
  const NoticeEvent();
  @override
  List<Object> get props => [];
}

class FetchNoticeEvent extends NoticeEvent {
  final int page;
  final Map<String, dynamic> filter;
  const FetchNoticeEvent({
    required this.page,
    this.filter = const {},
  });

  @override
  List<Object> get props => [page, filter];
}

class CreateNoticeEvent extends NoticeEvent {
  final Notice notice;
  const CreateNoticeEvent({
    required this.notice,
  });

  @override
  List<Object> get props => [notice];
}
class EditNoticeEvent extends NoticeEvent {
  final Notice notice;
  const EditNoticeEvent({
    required this.notice,
  });

  @override
  List<Object> get props => [notice];
}
class DeleteNoticeEvent extends NoticeEvent {
  final Notice notice;
  const DeleteNoticeEvent({
    required this.notice,
  });

  @override
  List<Object> get props => [notice];
}
class CheckAuthEvent extends NoticeEvent {
  @override
  List<Object> get props => [];
}
