import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/user/models/giveaway_model.dart';
import 'package:bloc_test/features/user/repository/user_repository.dart';
import 'blocs.dart';
import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';
import '../models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserLoaded? userPrevState;
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUser>(_onFetchUser);
    on<FetchUsers>(_onFetchUsers);
    on<ChangeTab>(_onChangeTab);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_deleteUser);
  }

  FutureOr<void> _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final User user = await userRepository.fetchUser(event.id);
      emit(UserHasLoaded());
      emit(UserLoaded(user: user));
      userPrevState = UserLoaded(user: user);
    } catch (e) {
      print(e);
      emit(UserLoadingFailed(error: e.toString()));
    }
  }

  FutureOr<void> _onChangeTab(ChangeTab event, Emitter<UserState> emit) async {
    emit(UserLoaded(
      user: userPrevState!.user,
      isPostLoading: true,
    ));
    try {
      if (event.index == 0) {
        final List<Giveaway> giveaway =
            await userRepository.fetchGiveaway(event.id);
        emit(UserLoaded(
            user: userPrevState!.user,
            isPostLoading: false,
            giveaway: giveaway));
        userPrevState =
            UserLoaded(user: userPrevState!.user, giveaway: giveaway);
      } else if (event.index == 1) {
        final List<LostItem> lostItem =
            await userRepository.fetchLostItem(event.id);
        emit(UserLoaded(
            user: userPrevState!.user,
            isPostLoading: false,
            lostItems: lostItem));
        userPrevState =
            UserLoaded(user: userPrevState!.user, lostItems: lostItem);
      } else if (event.index == 2) {
        final List<FoundItem> foundItem =
            await userRepository.fetchFoundItem(event.id);
        emit(UserLoaded(
            user: userPrevState!.user,
            isPostLoading: false,
            foundItems: foundItem));
        userPrevState =
            UserLoaded(user: userPrevState!.user, foundItems: foundItem);
      }
    } catch (e) {
      print(e);
      emit(UserLoadingFailed(error: e.toString()));
    }
  }

  FutureOr<void> _onUpdateUser(
      UpdateUser event, Emitter<UserState> emit) async {
    emit(UserLoaded(
      user: userPrevState!.user,
      isPostLoading: false,
      isUserUpdating: true,
      giveaway: userPrevState!.giveaway,
      lostItems: userPrevState!.lostItems,
      foundItems: userPrevState!.foundItems,
    ));
    print(event.user);
    try {
      final User user = await userRepository.updateUser(event.user);
      emit(UserLoaded(
        user: user,
        isPostLoading: false,
        isUserUpdating: false,
        giveaway: userPrevState!.giveaway,
        lostItems: userPrevState!.lostItems,
        foundItems: userPrevState!.foundItems,
      ));
    } catch (e) {
      emit(UserLoadingFailed(error: e.toString()));
      print(e);
    }
  }

  FutureOr<void> _onFetchUsers(
      FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final List<User> user = await userRepository.fetchUsers();
      emit(UsersLoaded(user: user));
    } catch (e) {
      emit(UserLoadingFailed(error: e.toString()));
    }
  }

  FutureOr<void> _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    await userRepository.delete(event.id);
  }
}
