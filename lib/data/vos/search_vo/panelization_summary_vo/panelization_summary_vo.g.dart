// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panelization_summary_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenalizationSummaryVO _$PenalizationSummaryVOFromJson(
        Map<String, dynamic> json) =>
    PenalizationSummaryVO(
      json['containsEpubBubbles'] as bool?,
      json['containsImageBubbles'] as bool?,
    );

Map<String, dynamic> _$PenalizationSummaryVOToJson(
        PenalizationSummaryVO instance) =>
    <String, dynamic>{
      'containsEpubBubbles': instance.containsEpubBubbles,
      'containsImageBubbles': instance.containsImageBubbles,
    };
