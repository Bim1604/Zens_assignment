import 'package:zens_assignment/datas/app_type.dart';
import 'package:zens_assignment/utils/string_utils.dart';

class JokeModel {
  int? id;
  String? content;
  JokeType? rate;

  JokeModel({this.id,this.content,this.rate,});

  factory JokeModel.fromJson(Map<String, dynamic>? json) {
    late JokeModel result = JokeModel();
    if (json != null) {
      result = JokeModel(
        id: json["id"],
        content:json["content"],
        rate:json["rate"] != null ? (json["rate"] == 1 ? JokeType.like : JokeType.dislike) : null,
      );
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "content": content,
      "rate": rate != null ? (rate == JokeType.like ? 1 : 0) : null,
    };
    return map;
  }

  String getJokeContent() {
    if (StringUtils.isNullOrWhite(content)) return '';
    return content!;
  }


}