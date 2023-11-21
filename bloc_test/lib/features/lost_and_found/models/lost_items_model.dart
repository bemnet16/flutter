import 'dart:convert';

import 'package:equatable/equatable.dart';

class LostItem extends Equatable {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String? imageUrl;
  final List<dynamic> userAddress;
  final String userId;
  final String userName;
  final String? userPicturePath;
  final String location;
  const LostItem({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.imageUrl,
    required this.userAddress,
    required this.userId,
    required this.userName,
    this.userPicturePath,
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        imageUrl,
        userAddress,
        userId,
        userName,
        userPicturePath,
        location,
      ];

  LostItem copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? imageUrl,
   List< String>? userAddress,
    String? userId,
    String? userName,
    String? userPicturePath,
    String? location,
  }) {
    return LostItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      userAddress: userAddress ?? this.userAddress,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPicturePath: userPicturePath ?? this.userPicturePath,
      location: location ?? this.location,
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
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    result.addAll({'userAddress': userAddress});
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    if (userPicturePath != null) {
      result.addAll({'userPicturePath': userPicturePath});
    }
    result.addAll({'location': location});

    return result;
  }

  factory LostItem.fromMap(Map<String, dynamic> map) {
    return LostItem(
      id: map['_id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'],
      userAddress: map['userAddress'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPicturePath: map['userPicturePath'],
      location: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LostItem.fromJson(String source) =>
      LostItem.fromMap(json.decode(source));
}
