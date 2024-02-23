import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_details.g.dart';

@JsonSerializable()
@immutable
final class UserDetail with EquatableMixin {
  const UserDetail({
    this.computerName,
    this.computerUrl,
    this.extensions,
    this.theme,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  final String? computerName;
  final String? computerUrl;
  final List<String>? extensions;
  final String? theme;

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  @override
  List<Object?> get props => [computerName, computerUrl, extensions, theme];

  UserDetail copyWith({
    String? computerName,
    String? computerUrl,
    List<String>? extensions,
    String? theme,
  }) {
    return UserDetail(
      computerName: computerName ?? this.computerName,
      computerUrl: computerUrl ?? this.computerUrl,
      extensions: extensions ?? this.extensions,
      theme: theme ?? this.theme,
    );
  }
}
