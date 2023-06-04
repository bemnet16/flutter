import 'package:equatable/equatable.dart';
import '../models/user_model.dart';
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUser extends UserEvent {
  final String id;
  const FetchUser({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
class FetchUsers extends UserEvent {
}

class ChangeTab extends UserEvent {
  final num index;
  final String id;
  const ChangeTab({
    required this.index,
    required this.id,
  });
  @override
  List<Object> get props => [index, id];
}

class UpdateUser extends UserEvent {
  final Map user;
  const UpdateUser({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}
class DeleteUser extends UserEvent {
  final String id;
  const DeleteUser({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
