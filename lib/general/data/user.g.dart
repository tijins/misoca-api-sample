// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      json['email'] as String,
      Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'plan': instance.plan,
    };

_$_Plan _$$_PlanFromJson(Map<String, dynamic> json) => _$_Plan(
      json['name'] as String,
    );

Map<String, dynamic> _$$_PlanToJson(_$_Plan instance) => <String, dynamic>{
      'name': instance.name,
    };
