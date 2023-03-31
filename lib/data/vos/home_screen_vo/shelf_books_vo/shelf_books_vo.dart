import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../constants/hive_constants.dart';
import '../books_vo/books_vo.dart';

part 'shelf_books_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kShelfBooksHiveType)
class ShelfBooksVO{
  @JsonKey(name: 'shelf_name')
  @HiveField(0)
  String ? shelfName;
  @JsonKey(name: 'books')
  @HiveField(1)
  List<BooksVO> ? books;

  ShelfBooksVO(this.shelfName, this.books);

  factory ShelfBooksVO.fromJson(Map<String,dynamic>json)=>_$ShelfBooksVOFromJson(json);
  Map<String,dynamic> toJson()=>_$ShelfBooksVOToJson(this);
}