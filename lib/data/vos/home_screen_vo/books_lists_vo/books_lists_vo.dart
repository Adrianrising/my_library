import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constants/hive_constants.dart';
import '../books_vo/books_vo.dart';


part 'books_lists_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kListsHiveType)
class BooksListsVO{
  @JsonKey(name: 'list_id')
  @HiveField(0)
  int ? listId;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String ? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String ? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String ? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String ? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String ? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  num ? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  num ? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BooksVO> ? books;


  BooksListsVO(
      this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books);

  factory BooksListsVO.fromJson(Map<String,dynamic>json)=>_$BooksListsVOFromJson(json);
  Map<String,dynamic>toJson()=>_$BooksListsVOToJson(this);
}

