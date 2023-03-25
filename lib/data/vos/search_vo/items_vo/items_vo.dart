import 'package:json_annotation/json_annotation.dart';

import '../access_info_vo/access_info_vo.dart';
import '../sale_info_vo/sale_info_vo.dart';
import '../search_info_vo/search_info_vo.dart';
import '../volume_info_vo/volume_info_vo.dart';

part 'items_vo.g.dart';
@JsonSerializable()
class ItemsVO{
  @JsonKey(name: 'kind')
  String ? kind;

  @JsonKey(name: 'id')
  String ? id;

  @JsonKey(name: 'etag')
  String ? eTag;

  @JsonKey(name: 'selfLink')
  String ? selfLink;

  @JsonKey(name: 'volumeInfo')
  VolumeInfoVO ? volumeInfo;

  @JsonKey(name: 'saleInfo')
  SaleInfoVO ? saleInfo;

  @JsonKey(name: 'accessInfo')
  AccessInfoVO ? accessInfo;

  @JsonKey(name: 'searchInfo')
  SearchInfoVO ? searchInfo;


  ItemsVO(this.kind, this.id, this.eTag, this.selfLink, this.volumeInfo,
      this.saleInfo, this.accessInfo, this.searchInfo);

  factory ItemsVO.fromJson(Map<String,dynamic>json)=>_$ItemsVOFromJson(json);
  Map<String,dynamic> toJson()=>_$ItemsVOToJson(this);
}