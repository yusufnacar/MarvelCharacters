import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_chars/view/home/model/response_data.dart';

import '../../../core/base/model/base_model.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel implements BaseModel<HomeResponseModel> {
  final int? code;
  final String? status;
  final ResponseData? data;

  HomeResponseModel({this.code, this.status, this.data});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeResponseModelToJson(this);
  }

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$HomeResponseModelFromJson(json);
  }
}
