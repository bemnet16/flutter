import 'dart:convert';

import 'package:equatable/equatable.dart';

class Essay extends Equatable {
  final String? id;
  final String content;
  final String userId;
  final String userName;
  final String? userProfileImg;
  final String giveAwayItemId;

  @override
  List<Object?> get props =>
      [content, userId, userName, userProfileImg, giveAwayItemId, id];
  const Essay({
    this.id,
    required this.content,
    required this.userId,
    required this.userName,
    this.userProfileImg,
    required this.giveAwayItemId,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'_id': id});
    }
    result.addAll({'content': content});
    result.addAll({'userId': userId});
    result.addAll({'userName': userName});
    if (userProfileImg != null) {
      result.addAll({'userProfileImg': userProfileImg});
    }
    result.addAll({'giveAwayItemId': giveAwayItemId});
    return result;
  }

  factory Essay.fromMap(Map<String, dynamic> map) {
    return Essay(
      id: map['_id'],
      content: map['content'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userProfileImg: map['userProfileImg'],
      giveAwayItemId: map['giveAwayItemId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Essay.fromJson(String source) => Essay.fromMap(json.decode(source));

  Essay copyWith({
    String? id,
    String? content,
    String? userId,
    String? userName,
    String? userProfileImg,
    String? giveAwayItemId,
  }) {
    return Essay(
      id: id ?? this.id,
      content: content ?? this.content,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userProfileImg: userProfileImg ?? this.userProfileImg,
      giveAwayItemId: giveAwayItemId ?? this.giveAwayItemId,
    );
  }
}
