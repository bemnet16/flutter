import 'package:equatable/equatable.dart';

import 'package:bloc_test/features/giveaway_detail/models/giveaway_model.dart';

import '../models/essay_model.dart';

class GiveawayDetailState extends Equatable {
  final Giveaway giveaway;
  final List<Essay> essays;
  final bool isLoading;
  final bool isEssayloading;
  final bool isError;
  final String error;
  const GiveawayDetailState(
      {this.giveaway = const Giveaway(),
      this.essays = const [],
      this.isLoading = true,
      this.isError = false,
      this.error = "",
      this.isEssayloading = false});

  @override
  List<Object> get props =>
      [giveaway, essays, isLoading, isError, error, isEssayloading];

  GiveawayDetailState copyWith({
    Giveaway? giveaway,
    List<Essay>? essays,
    bool? isLoading,
    bool? isEssayloading,
    bool? isError,
    String? error,
  }) {
    return GiveawayDetailState(
      giveaway: giveaway ?? this.giveaway,
      essays: essays ?? this.essays,
      isLoading: isLoading ?? this.isLoading,
      isEssayloading: isEssayloading ?? this.isEssayloading,
      isError: isError ?? this.isError,
      error: error ?? this.error,
    );
  }
}
