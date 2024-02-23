// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      computerName: json['computerName'] as String?,
      computerUrl: json['computerUrl'] as String?,
      extensions: (json['extensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'computerName': instance.computerName,
      'computerUrl': instance.computerUrl,
      'extensions': instance.extensions,
      'theme': instance.theme,
    };
