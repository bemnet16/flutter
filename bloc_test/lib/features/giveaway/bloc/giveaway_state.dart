part of 'giveaway_bloc.dart';

class GiveawayState extends Equatable {
  final bool isLoading;

  final List<Giveaway> giveaways;
  const GiveawayState({
    this.isLoading = false,
    this.giveaways = const [],
  });

  @override
  List<Object> get props => [isLoading, giveaways];

  GiveawayState copyWith({
    bool? isLoading,
    String? error,
    List<Giveaway>? giveaways,
  }) {
    return GiveawayState(
      isLoading: isLoading ?? this.isLoading,
      giveaways: giveaways ?? this.giveaways,
    );
  }
}
