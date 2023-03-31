import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constants/hive_constants.dart';
import '../search_vo/items_vo/items_vo.dart';
part 'search_history_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kSearchHistoryHiveType)
class SearchHistoryVO{
  @JsonKey(name: 'search_title')
  @HiveField(0)
  String ? searchTitle;

  @JsonKey(name: 'search_items')
  @HiveField(1)
  String ? searchItems;

  SearchHistoryVO(this.searchTitle, this.searchItems);

  factory SearchHistoryVO.fromJson(Map<String,dynamic>json)=>_$SearchHistoryVOFromJson(json);
  Map<String,dynamic> toJson()=>_$SearchHistoryVOToJson(this);
}