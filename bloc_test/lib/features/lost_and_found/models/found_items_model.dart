import 'dart:convert';

import 'package:equatable/equatable.dart';

class FoundItem extends Equatable {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String? imageUrl;
  final String userId;
  final String userName;
  final String? userPicturePath;
  final String location;
  final List<String> userAddress;
  final List<Map<String, dynamic>>? claimQuestions;
  final List<String>? claimQuestionAnswers;
  const FoundItem({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.imageUrl,
    required this.userId,
    required this.userName,
    this.userPicturePath,
    required this.location,
    required this.userAddress,
    this.claimQuestions,
    this.claimQuestionAnswers,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        imageUrl,
        userId,
        userName,
        userPicturePath,
        location,
        userAddress,
        claimQuestions,
        claimQuestionAnswers,
      ];

  FoundItem copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? imageUrl,
    String? userId,
    String? userName,
    String? userPicturePath,
    String? location,
    List<String>? userAddress,
    List<Map<String, dynamic>>? claimQuestions,
    List<String>? claimQuestionAnswers,
  }) {
    return FoundItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPicturePath: userPicturePath ?? this.userPicturePath,
      location: location ?? this.location,
      userAddress: userAddress ?? this.userAddress,
      claimQuestions: claimQuestions ?? this.claimQuestions,
      claimQuestionAnswers: claimQuestionAnswers ?? this.claimQuestionAnswers,
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
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    if (userPicturePath != null) {
      result.addAll({'userPicturePath': userPicturePath});
    }
    result.addAll({'location': location});
    result.addAll({'userAddress': userAddress});
    if (claimQuestions != null) {
      result.addAll({'claimQuestions': claimQuestions});
    }
    if (claimQuestionAnswers != null) {
      result.addAll({'claimQuestionAnswers': claimQuestionAnswers});
    }

    return result;
  }

  factory FoundItem.fromMap(Map<String, dynamic> map) {
    return FoundItem(
      id: map['_id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'],
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPicturePath: map['userPicturePath'],
      location: map['location'] ?? '',
      userAddress: List<String>.from(map['userAddress']),
      claimQuestions: map['claimQuestions'] != null
          ? List<Map<String, dynamic>>.from(
              map['claimQuestions']?.map((x) => Map<String, dynamic>.from(x)))
          : null,
      claimQuestionAnswers: List<String>.from(map['claimQuestionAnswers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoundItem.fromJson(String source) =>
      FoundItem.fromMap(json.decode(source));
}
