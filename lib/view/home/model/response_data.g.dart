// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      json['limit'] as int?,
      json['offset'] as int?,
      (json['results'] as List<dynamic>)
          .map((e) => MarvelResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'results': instance.results,
    };
