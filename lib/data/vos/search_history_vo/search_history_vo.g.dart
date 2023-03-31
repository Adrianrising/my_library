// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchHistoryVOAdapter extends TypeAdapter<SearchHistoryVO> {
  @override
  final int typeId = 6;

  @override
  SearchHistoryVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchHistoryVO(
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchHistoryVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.searchTitle)
      ..writeByte(1)
      ..write(obj.searchItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchHistoryVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryVO _$SearchHistoryVOFromJson(Map<String, dynamic> json) =>
    SearchHistoryVO(
      json['search_title'] as String?,
      json['search_items'] as String?,
    );

Map<String, dynamic> _$SearchHistoryVOToJson(SearchHistoryVO instance) =>
    <String, dynamic>{
      'search_title': instance.searchTitle,
      'search_items': instance.searchItems,
    };
