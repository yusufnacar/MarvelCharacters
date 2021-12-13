import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_chars/core/base/model/base_model.dart';
import 'package:marvel_chars/view/home/model/marvel_results.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData implements BaseModel<ResponseData> {
  final int? limit;
  final int? offset;
  final List<MarvelResults> results;

  ResponseData(
    this.limit,
    this.offset,
    this.results,
  );

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ResponseDataFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ResponseDataToJson(this);
  }

  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return _$ResponseDataFromJson(json);
  }
}
