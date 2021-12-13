import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_chars/core/base/model/base_model.dart';

part 'thumbnail.g.dart';

@JsonSerializable()
class Thumbnail implements BaseModel<Thumbnail> {
  final String? path;
  final String? extension;

  Thumbnail(this.path, this.extension);

  String get thumbnailPic {
    if (path != null && extension != null) {
      return path! + "." + extension!;
    } else {
      return "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg";
    }
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ThumbnailFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ThumbnailToJson(this);
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return _$ThumbnailFromJson(json);
  }
}
