import 'package:json_annotation/json_annotation.dart';

import '../../../../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';

part 'results.g.dart';
@JsonSerializable()
class Results{
  @JsonKey(name: 'bestsellers_date')
  String ? bestSellersDate;

  @JsonKey(name: 'published_date')
  String ? publishedDate;

  @JsonKey(name: 'published_date_description')
  String ? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  String ? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  String ? nextPublishedDate;

  @JsonKey(name: 'lists')
  List<BooksListsVO> ? lists;

  Results(
      this.bestSellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory Results.fromJson(Map<String,dynamic>json)=>_$ResultsFromJson(json);
  Map<String,dynamic>toJson()=>_$ResultsToJson(this);
}

