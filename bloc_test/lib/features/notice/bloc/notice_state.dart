part of 'notice_bloc.dart';

class NoticeState extends Equatable {
  final bool isLoading;
  final String error;
  final List<Notice> notices;
  const NoticeState({
    this.isLoading = false,
    this.error = "",
    this.notices = const [],
  });

  @override
  List<Object> get props => [isLoading,error,notices];

  NoticeState copyWith({
    bool? isLoading,
    String? error,
    List<Notice>? notices,
  }) {
    return NoticeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      notices: notices ?? this.notices,
    );
  }
}
