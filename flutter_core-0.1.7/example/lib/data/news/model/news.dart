import 'package:flutter_core/core/data/abstract/exeption/exeption.dart';

class GitHubUserDTO {
  int id;
  String name;

  GitHubUserDTO({this.id, this.name});

  factory GitHubUserDTO.fromJson(Map<String, dynamic> map) =>
      GitHubUserDTO(id: map['id'], name: map['login']);
}
