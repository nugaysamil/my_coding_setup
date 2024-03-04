// ignore_for_file: sort_constructors_first

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'user.g.dart';

@JsonSerializable()
@immutable // ignore: undefined_identifier
final class User with EquatableMixin {
  const User({
    this.githubId,
    this.userName,
    this.githubUrl,
    this.name,
    this.photo,
    this.shortBio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? githubUrl;
  final String? name;
  final String? photo;
  final String? shortBio;
  final String? userName;
  final int?  githubId;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [githubUrl, name, photo, shortBio];

  User copyWith({
    String? githubUrl,
    String? name,
    String? photo,
    String? shortBio,
    String? userName,
    int? githubId,
  }) {
    return User(
      githubUrl: githubUrl ?? this.githubUrl,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      userName: userName ?? this.userName,
      shortBio: shortBio ?? this.shortBio,
      githubId: githubId ?? this.githubId,
    );
  }
}

extension UserExtension on User {
  bool get isEmpty =>
      githubUrl == null ||
      name == null ||
      photo == null ||
      shortBio == null ||
      userName == null || githubId == null;
}
