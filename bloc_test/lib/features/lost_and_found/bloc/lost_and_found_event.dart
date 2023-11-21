import 'package:equatable/equatable.dart';

import '../models/found_items_model.dart';
import '../models/lost_items_model.dart';

abstract class LostAndFoundEvent extends Equatable {
  const LostAndFoundEvent();

  @override
  List<Object> get props => [];
}

class FetchLostOrFoundEvent extends LostAndFoundEvent {
  final int index;
  final num page;
  final Map<String, dynamic> filter;
  const FetchLostOrFoundEvent({
    required this.index,
    required this.page,
     this.filter=const {},
  });

  @override
  List<Object> get props => [index, page, filter];
}

class CreateFoundItem extends LostAndFoundEvent {
  final FoundItem foundItem;
  const CreateFoundItem({
    required this.foundItem,
  });
  @override
  List<Object> get props => [foundItem];
}

class CreateLostItem extends LostAndFoundEvent {
  final LostItem lostItem;
  const CreateLostItem({
    required this.lostItem,
  });
  @override
  List<Object> get props => [lostItem];
}

class DeleteFoundItem extends LostAndFoundEvent {
  final FoundItem foundItem;
  const DeleteFoundItem({
    required this.foundItem,
  });
  @override
  List<Object> get props => [foundItem];
}

class DeleteLostItem extends LostAndFoundEvent {
  final LostItem lostItem;
  const DeleteLostItem({
    required this.lostItem,
  });
  @override
  List<Object> get props => [lostItem];
}
