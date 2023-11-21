import 'package:equatable/equatable.dart';

import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';

abstract class LostAndFoundState extends Equatable {
  const LostAndFoundState();
  @override
  List<Object?> get props => [];
}

class FoundItemOprationSuccess extends LostAndFoundState {
  final List<FoundItem> foundItem;
  const FoundItemOprationSuccess({required this.foundItem});

  @override
  List<Object?> get props => [foundItem];
}

class LostItemOprationSuccess extends LostAndFoundState {
  final List<LostItem> lostItem;
  const LostItemOprationSuccess({required this.lostItem});

  @override
  List<Object?> get props => [lostItem];
}

class LoadingState extends LostAndFoundState {}

class CreatingState extends LostAndFoundState {}

class LostAndFoundInitial extends LostAndFoundState {}

class ErrorState extends LostAndFoundState {
  final String error;
  const ErrorState({
    required this.error,
  });
}
