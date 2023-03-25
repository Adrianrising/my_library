import 'package:json_annotation/json_annotation.dart';
part 'panelization_summary_vo.g.dart';
@JsonSerializable()
class PenalizationSummaryVO{
  @JsonKey(name: 'containsEpubBubbles')
  bool ? containsEpubBubbles;
  @JsonKey(name: 'containsImageBubbles')
  bool ? containsImageBubbles;

  PenalizationSummaryVO(this.containsEpubBubbles, this.containsImageBubbles);

  factory PenalizationSummaryVO.fromJson(Map<String,dynamic>json)=>_$PenalizationSummaryVOFromJson(json);
  Map<String,dynamic>toJson()=>_$PenalizationSummaryVOToJson(this);
}