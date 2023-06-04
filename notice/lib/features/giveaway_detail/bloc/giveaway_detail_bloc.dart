import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_test/features/giveaway/data_provider/local_databse_provider.dart';


import 'package:bloc_test/features/giveaway_detail/models/giveaway_model.dart';
import 'package:connectivity/connectivity.dart';
import '../models/essay_model.dart';
import '../repository/giveaway_detail_repository.dart';
import 'blocs.dart';

class GiveawayDetailBloc
    extends Bloc<GiveawayDetailEvent, GiveawayDetailState> {
  final GiveawayDetailRepository giveawayDetailRepository;
  final GiveawayDatabaseProvider giveawayDatabaseProvider;
  GiveawayDetailBloc(
      {required this.giveawayDetailRepository,required this.giveawayDatabaseProvider})
      : super(const GiveawayDetailState()) {
    on<FetchGiveaway>(_onFetchGiveaway);
    on<FetchGiveawayEssay>(_onFetchGiveawayEssay);
    on<CreateEssay>(_onCreateEssay);
  }

  FutureOr<void> _onFetchGiveaway(
      FetchGiveaway event, Emitter<GiveawayDetailState> emit) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final state = this.state;
    if (connectivityResult != ConnectivityResult.none) {
    emit(state.copyWith(isLoading: true));
    try {
      final Giveaway giveaway = await giveawayDetailRepository.fetch(event.id);
      emit(state.copyWith(giveaway: giveaway, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isError: true, error: e.toString()));
    }
    }
    else{
      final  Giveaway giveaway = (await giveawayDatabaseProvider.getGiveawayById(event.id)) as Giveaway;
      emit(state.copyWith(giveaway: giveaway, isLoading: false));
    }
    
  }

  FutureOr<void> _onFetchGiveawayEssay(
      FetchGiveawayEssay event, Emitter<GiveawayDetailState> emit) async {
    final state = this.state;
    emit(state.copyWith(isEssayloading: true));
    try {
      final List<Essay> essays =
          await giveawayDetailRepository.fetchAllEssays(event.id);
      emit(state.copyWith(essays: essays, isEssayloading: false));
    } catch (e) {
      emit(state.copyWith(isError: true, error: e.toString()));
    }
  }

  FutureOr<void> _onCreateEssay(
      CreateEssay event, Emitter<GiveawayDetailState> emit) async {
    final state = this.state;

    try {
      Essay essay = await giveawayDetailRepository.create(event.essay);
      emit(state.copyWith(essays: [essay, ...state.essays]));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
