import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/notice/model/notice_model.dart';
import 'package:equatable/equatable.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../repository/notice_repository.dart';
part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  final NoticeRepository noticeRepository;
  final AuthBloc authBloc;
  NoticeBloc({required this.noticeRepository, required this.authBloc})
      : super(const NoticeState()) {
    on<FetchNoticeEvent>(_onFetchNoticeEvent);
    on<CreateNoticeEvent>(_onCreateNoticeEvent);
    on<EditNoticeEvent>(_onEditNoticeEvent);
    on<DeleteNoticeEvent>(_onDeleteNoticeEvent);
    on<CheckAuthEvent>(_onCheckAuthEvent);
  }

  FutureOr<void> _onFetchNoticeEvent(
      FetchNoticeEvent event, Emitter<NoticeState> emit) async {
    final state = this.state;
    emit(state.copyWith(isLoading: true));
    try {
      List<Notice> notices =
          await noticeRepository.fetchAll(event.page, event.filter);

      if (event.page == 1) {
        emit(state.copyWith(isLoading: false, notices: notices));
      } else {
        emit(state.copyWith(
            isLoading: false, notices: [...state.notices, ...notices]));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _onEditNoticeEvent(
      EditNoticeEvent event, Emitter<NoticeState> emit) async {
    final state = this.state;
    final index = state.notices.indexOf(event.notice);
    try {
      emit(state.copyWith(isLoading: true));
      Notice notice = await noticeRepository.update(event.notice);
      state.notices[index] = notice;
      emit(state.copyWith(isLoading: false, notices: state.notices));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _onCreateNoticeEvent(
      CreateNoticeEvent event, Emitter<NoticeState> emit) async {
    final state = this.state;
    try {
      emit(state.copyWith(isLoading: true));
      Notice notice = await noticeRepository.create(event.notice);
      state.notices.add(notice);
      emit(state.copyWith(isLoading: false, notices: state.notices));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _onDeleteNoticeEvent(
      DeleteNoticeEvent event, Emitter<NoticeState> emit) async {
    final state = this.state;
    try {
      await noticeRepository.delete(event.notice);
      state.notices.remove(event.notice);
      emit(state.copyWith(isLoading: false, notices: state.notices));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  FutureOr<void> _onCheckAuthEvent(
      CheckAuthEvent event, Emitter<NoticeState> emit) {
    authBloc.add(CheckAuthEvent() as AuthEvent);
  }
}
