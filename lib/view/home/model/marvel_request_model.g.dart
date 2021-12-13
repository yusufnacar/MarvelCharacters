// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelRequestModel _$MarvelRequestModelFromJson(Map<String, dynamic> json) =>
    MarvelRequestModel(
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      apikey: json['apikey'] as String?,
      hash: json['hash'] as String?,
      orderBy: json['orderBy'] as String?,
      ts: json['ts'] as String?,
    );

Map<String, dynamic> _$MarvelRequestModelToJson(MarvelRequestModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'apikey': instance.apikey,
      'hash': instance.hash,
      'orderBy': instance.orderBy,
      'ts': instance.ts,
    };
