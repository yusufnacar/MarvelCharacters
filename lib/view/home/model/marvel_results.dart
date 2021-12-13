import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_chars/core/base/model/base_model.dart';

import 'package:marvel_chars/view/home/model/thumbnail.dart';

part 'marvel_results.g.dart';

@JsonSerializable()
class MarvelResults implements BaseModel<MarvelResults> {
  final int? id;
  final String? name;
  final String? title;
  final String? description;
  final String? modified;
  final Thumbnail thumbnail;

  MarvelResults(
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.title,
  );

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MarvelResultsFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MarvelResultsToJson(this);
  }

  factory MarvelResults.fromJson(Map<String, dynamic> json) {
    return _$MarvelResultsFromJson(json);
  }
}


//http://gateway.marvel.com/v1/public/comics?ts=3&apikey=b57e20eb76b17140490da1c511c160e9&hash=40b1ee50213cfde90983816787a1ca8d