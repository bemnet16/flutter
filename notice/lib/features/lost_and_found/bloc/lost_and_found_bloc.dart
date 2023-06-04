import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/lost_and_found/models/found_items_model.dart';
import 'package:bloc_test/features/lost_and_found/models/lost_items_model.dart';
import 'package:connectivity/connectivity.dart';

import 'blocs.dart';
import '../repository/lost_and_found_repository.dart';

class LostAndFoundBloc extends Bloc<LostAndFoundEvent, LostAndFoundState> {
  final LostAndFoundRepository lostAndFoundRepository;
  List<LostItem> _lostItems = [];
  List<FoundItem> _foundItems = [];

  LostAndFoundBloc({required this.lostAndFoundRepository})
      : super(LoadingState()) {
    lostAndFoundRepository.openFoundDatabase();
    lostAndFoundRepository.openLostDatabase();
    on<FetchLostOrFoundEvent>(_onFetchLostOrFoundEvent);
    on<CreateFoundItem>(_onCreateFoundItem);
    on<CreateLostItem>(_onCreateLostItem);
    on<DeleteFoundItem>(_onDeleteFoundItem);
    on<DeleteLostItem>(_onDeleteLostItem);
  }
   @override
  Future<void> close() {
    // Close the database when the bloc is closed
    lostAndFoundRepository.closeFoundDatabase();
    lostAndFoundRepository.closeLostDatabase();
    return super.close();
  }

  FutureOr<void> _onFetchLostOrFoundEvent(
      FetchLostOrFoundEvent event, Emitter<LostAndFoundState> emit) async {
    emit(LoadingState());
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        if (event.index == 0) {
          final lostItem = await lostAndFoundRepository.fetchAllLostItems(
              event.page, event.filter);
          _lostItems.addAll(lostItem);
          _foundItems = [];
          emit(LostItemOprationSuccess(lostItem: lostItem));
          await lostAndFoundRepository.deleteLostItemFromLocal();
          await lostAndFoundRepository.createLostItemFromLocal(lostItem);
        } else if (event.index == 1) {
          final foundItem = await lostAndFoundRepository.fetchAllFoundItems(
              event.page, event.filter);
          emit(FoundItemOprationSuccess(foundItem: foundItem));
          _foundItems.addAll(foundItem);
          _lostItems = [];
          await lostAndFoundRepository.deleteFoundItemFromLocal();
          await lostAndFoundRepository.createFoundItemfromLocal(foundItem);
        }
      } catch (e) {
        emit(ErrorState(error: e.toString()));
      }
    } else {
      if (event.index == 0) {
        final lostItem =
            await lostAndFoundRepository.fetchAllLostItemsFromLocal();
        emit(LostItemOprationSuccess(lostItem: lostItem));
      } else if (event.index == 1) {
        final foundItem =
            await lostAndFoundRepository.fetchAllFoundItemsFromLocal();
        emit(FoundItemOprationSuccess(foundItem: foundItem));
      }
    }
  }

  FutureOr<void> _onCreateFoundItem(
      CreateFoundItem event, Emitter<LostAndFoundState> emit) async {
    emit(CreatingState());
    try {
      FoundItem foundItem =
          await lostAndFoundRepository.createFoundItem(event.foundItem);
      _foundItems.add(foundItem);
      emit(FoundItemOprationSuccess(foundItem: _foundItems));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _onCreateLostItem(
      CreateLostItem event, Emitter<LostAndFoundState> emit) async {
    emit(CreatingState());
    try {
      LostItem lostItem =
          await lostAndFoundRepository.createLostItem(event.lostItem);
      _lostItems.add(lostItem);
      emit(LostItemOprationSuccess(lostItem: _lostItems));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
      print(e);
    }
  }

  FutureOr<void> _onDeleteFoundItem(
      DeleteFoundItem event, Emitter<LostAndFoundState> emit) async {
    try {
      lostAndFoundRepository.deleteFoundItem(event.foundItem);
      _foundItems.remove(event.foundItem);
      emit(FoundItemOprationSuccess(foundItem: _foundItems));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  FutureOr<void> _onDeleteLostItem(
      DeleteLostItem event, Emitter<LostAndFoundState> emit) {
    try {
      lostAndFoundRepository.deleteLostItem(event.lostItem);
      _lostItems.remove(event.lostItem);
      emit(LostItemOprationSuccess(lostItem: _lostItems));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
