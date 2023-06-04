part of 'giveaway_bloc.dart';

abstract class GiveawayEvent extends Equatable {
  const GiveawayEvent();

  @override
  List<Object> get props => [];
}

class FetchGiveawayEvent extends GiveawayEvent {
  final int page;
  final Map<String, dynamic> filter;
  const FetchGiveawayEvent({
    required this.page,
    this.filter = const {},
  });

  @override
  List<Object> get props => [page, filter];
}

class CreateGiveawayEvent extends GiveawayEvent {
  final Giveaway giveaway;
  const CreateGiveawayEvent({
    required this.giveaway,
  });

  @override
  List<Object> get props => [giveaway];
}

class EditGiveawayEvent extends GiveawayEvent {
  final Giveaway giveaway;
  const EditGiveawayEvent({
    required this.giveaway,
  });

  @override
  List<Object> get props => [giveaway];
}

class DeleteGiveawayEvent extends GiveawayEvent {
  final Giveaway giveaway;
  const DeleteGiveawayEvent({
    required this.giveaway,
  });

  @override
  List<Object> get props => [giveaway];
}

class CheckAuthEvent extends GiveawayEvent {
  @override
  List<Object> get props => [];
}
