import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/giveaway/model/giveaway_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import '../repository/giveaway_repository.dart';
part 'giveaway_event.dart';
part 'giveaway_state.dart';

class GiveawayBloc extends Bloc<GiveawayEvent, GiveawayState> {
  final GiveawayRepository giveawayRepository;
  GiveawayBloc({required this.giveawayRepository})
      : super(const GiveawayState()) {
    giveawayRepository.open();
    on<FetchGiveawayEvent>(_onFetchGiveawayEvent);
    on<CreateGiveawayEvent>(_onCreateGiveawayEvent);
    on<EditGiveawayEvent>(_onEditGiveawayEvent);
    on<DeleteGiveawayEvent>(_onDeleteGiveawayEvent);
  }
  @override
  Future<void> close() {
    // Close the database when the bloc is closed
    giveawayRepository.close();
    return super.close();
  }

  FutureOr<void> _onFetchGiveawayEvent(
      FetchGiveawayEvent event, Emitter<GiveawayState> emit) async {
    final state = this.state;
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      emit(const GiveawayState(isLoading: true));
      try {
        List<Giveaway> giveaways =
            await giveawayRepository.fetchAll(event.page, event.filter);
        emit(state.copyWith(isLoading: false, giveaways: giveaways));
        await giveawayRepository.deleteFromLocal();
        await giveawayRepository.createFromLocal(giveaways);
      } catch (e) {
        print(e);
      }
    } else {
      List<Giveaway> giveaways = await giveawayRepository.fetchAllFromLocal();
      emit(state.copyWith(isLoading: false, giveaways: giveaways));
    }
  }

  FutureOr<void> _onCreateGiveawayEvent(
      CreateGiveawayEvent event, Emitter<GiveawayState> emit) async {
    final state = this.state;
    emit(state.copyWith(isLoading: true));
    try {
      Giveaway giveaway = await giveawayRepository.create(event.giveaway);
      state.giveaways.add(giveaway);
      emit(state.copyWith(isLoading: false, giveaways: state.giveaways));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _onEditGiveawayEvent(
      EditGiveawayEvent event, Emitter<GiveawayState> emit) async {
    final state = this.state;
    final index = state.giveaways.indexOf(event.giveaway);
    try {
      emit(state.copyWith(isLoading: true));
      Giveaway giveaway = await giveawayRepository.update(event.giveaway);
      state.giveaways[index] = giveaway;
      emit(state.copyWith(isLoading: false, giveaways: state.giveaways));
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _onDeleteGiveawayEvent(
      DeleteGiveawayEvent event, Emitter<GiveawayState> emit) async {
    final state = this.state;
    try {
      await giveawayRepository.delete(event.giveaway);
      state.giveaways.remove(event.giveaway);
      emit(state.copyWith(isLoading: false, giveaways: state.giveaways));
    } catch (e) {
      print(e);
    }
  }
}
