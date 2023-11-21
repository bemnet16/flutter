import 'dart:convert';

import 'package:equatable/equatable.dart';

class Notice extends Equatable {
  final String? id;
  final String title;
  final String content;
  final String auther;
  final String visiblity;
  final String year;
  final String typeOfProgram;
  final String userId;
  final String department;
  final String? imgUrl;
  final String? attachementUrl;
  final List<String>? tags;
  const Notice({
    this.id,
    required this.title,
    required this.content,
    required this.auther,
    required this.visiblity,
    required this.year,
    required this.typeOfProgram,
    required this.userId,
    required this.department,
    this.imgUrl,
    this.attachementUrl,
    this.tags,
  });


  @override
  List<Object?> get props => [
        id,
        title,
        content,
        auther,
        visiblity,
        year,
        typeOfProgram,
        userId,
        department,
        imgUrl,
        attachementUrl,
        tags,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'auther': auther});
    result.addAll({'visiblity': visiblity});
    result.addAll({'year': year});
    result.addAll({'typeOfProgram': typeOfProgram});
    result.addAll({'userId': userId});
    result.addAll({'department': department});
    if(imgUrl != null){
      result.addAll({'imgUrl': imgUrl});
    }
    if(attachementUrl != null){
      result.addAll({'attachementUrl': attachementUrl});
    }
    if(tags != null){
      result.addAll({'tags': tags});
    }
  
    return result;
  }

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      id: map['id'],
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      auther: map['auther'] ?? '',
      visiblity: map['visiblity'] ?? '',
      year: map['year'] ?? '',
      typeOfProgram: map['typeOfProgram'] ?? '',
      userId: map['userId'] ?? '',
      department: map['department'] ?? '',
      imgUrl: map['imgUrl'],
      attachementUrl: map['attachementUrl'],
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notice.fromJson(String source) => Notice.fromMap(json.decode(source));
}
