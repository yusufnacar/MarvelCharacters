import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_chars/core/base/model/base_model.dart';

part 'marvel_request_model.g.dart';

@JsonSerializable()
class MarvelRequestModel implements BaseModel<MarvelRequestModel> {
  final int? limit;
  final int? offset;
  final String? apikey;
  final String? hash;
  final String? orderBy;
  final String? ts;

  MarvelRequestModel({
    this.limit,
    this.offset,
    this.apikey,
    this.hash,
    this.orderBy,
    this.ts,
  });

  @override
  fromJson(Map<String, dynamic> json) {
    return _$MarvelRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MarvelRequestModelToJson(this);
  }
}
