
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constants/hive_constants.dart';

part 'buy_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kBuyLinksHiveType)
class BuyLinksVO{
  @JsonKey(name: 'name')
  @HiveField(0)
  String ? name;

  @HiveField(1)
  @JsonKey(name: 'url')
  String ? url;

  BuyLinksVO(this.name, this.url);

  factory BuyLinksVO.fromJson(Map<String,dynamic>json)=>_$BuyLinksVOFromJson(json);
  Map<String,dynamic> toJson()=>_$BuyLinksVOToJson(this);
}
