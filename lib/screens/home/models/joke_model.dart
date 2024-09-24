import 'package:zens_assignment/datas/app_type.dart';
import 'package:zens_assignment/utils/string_utils.dart';

class JokeModel {
  int? id;
  String? content;
  JokeType? rate;

  JokeModel({this.id,this.content,this.rate,});

  String getJokeContent() {
    if (StringUtils.isNullOrWhite(content)) return '';
    return content!;
  }
}