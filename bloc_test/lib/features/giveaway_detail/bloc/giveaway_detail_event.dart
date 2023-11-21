

import 'package:equatable/equatable.dart';

import '../models/essay_model.dart';

abstract class GiveawayDetailEvent extends Equatable {
  const GiveawayDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchGiveaway extends GiveawayDetailEvent {
  final String id;
  const FetchGiveaway({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class FetchGiveawayEssay extends GiveawayDetailEvent {
  final String id;
  const FetchGiveawayEssay({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CreateEssay extends GiveawayDetailEvent {
  final Essay essay;
  const CreateEssay({
    required this.essay,
  });

  @override
  List<Object> get props => [essay];
}
