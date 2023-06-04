import 'package:equatable/equatable.dart';

import '../models/found_items_model.dart';
import '../models/giveaway_model.dart';
import '../models/lost_items_model.dart';
import '../models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserHasLoaded extends UserState {}

class UserLoadingFailed extends UserState {
  final String error;
  const UserLoadingFailed({
    required this.error,
  });
}

class UsersLoaded extends UserState {
  final List<User> user;
  const UsersLoaded({required this.user});
}

class UserLoaded extends UserState {
  final User user;
  final bool isPostLoading;
  final bool isUserUpdating;
  final List<Giveaway> giveaway;
  final List<LostItem> lostItems;
  final List<FoundItem> foundItems;
  const UserLoaded({
    required this.user,
    this.isPostLoading = true,
    this.isUserUpdating = false,
    this.giveaway = const [],
    this.lostItems = const [],
    this.foundItems = const [],
  });
  @override
  List<Object> get props => [
        user,
        isPostLoading,
        giveaway,
        lostItems,
        foundItems,
      ];
}
