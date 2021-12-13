// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarvelResults _$MarvelResultsFromJson(Map<String, dynamic> json) =>
    MarvelResults(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['modified'] as String?,
      Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['title'] as String?,
    );

Map<String, dynamic> _$MarvelResultsToJson(MarvelResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'modified': instance.modified,
      'thumbnail': instance.thumbnail,
    };
