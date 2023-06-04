import 'dart:convert';

import 'package:equatable/equatable.dart';

class Giveaway extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? category;
  final String? condition;
  final String? imageUrl;
  final String? userId;
  final String? userPicturePath;
  final bool? isAvailable;
  const Giveaway({
    this.id,
    this.title,
    this.description,
    this.category,
    this.condition,
    this.imageUrl,
    this.userId,
    this.userPicturePath,
    this.isAvailable,
  });
  factory Giveaway.intial() {
    return const Giveaway();
  }
  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        condition,
        imageUrl,
        userId,
        userPicturePath,
        isAvailable
      ];

  Giveaway copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? condition,
    String? imageUrl,
    String? userId,
    String? userPicturePath,
    bool? isAvailable,
  }) {
    return Giveaway(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userPicturePath: userPicturePath ?? this.userPicturePath,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'_id': id});
    }
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'category': category});
    result.addAll({'condition': condition});
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    result.addAll({'userId': userId});
    if (userPicturePath != null) {
      result.addAll({'userPicturePath': userPicturePath});
    }
    result.addAll({'isAvailable': isAvailable});

    return result;
  }

  factory Giveaway.fromMap(Map<String, dynamic> map) {
    return Giveaway(
      id: map['_id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      condition: map['condition'] ?? '',
      imageUrl: map['imageUrl'],
      userId: map['userId'] ?? '',
      userPicturePath: map['userPicturePath'],
      isAvailable: map['isAvailable'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Giveaway.fromJson(String source) =>
      Giveaway.fromMap(json.decode(source));
}
