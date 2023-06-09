// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_lists_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksListsVOAdapter extends TypeAdapter<BooksListsVO> {
  @override
  final int typeId = 3;

  @override
  BooksListsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksListsVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as num?,
      fields[7] as num?,
      (fields[8] as List?)?.cast<BooksVO>(),
      containsFavoriteBook: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, BooksListsVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.listId)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.books)
      ..writeByte(9)
      ..write(obj.containsFavoriteBook);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksListsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksListsVO _$BooksListsVOFromJson(Map<String, dynamic> json) => BooksListsVO(
      json['list_id'] as int?,
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      json['list_image'] as String?,
      json['list_image_width'] as num?,
      json['list_image_height'] as num?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      containsFavoriteBook: json['containsFavoriteBook'] as bool? ?? false,
    );

Map<String, dynamic> _$BooksListsVOToJson(BooksListsVO instance) =>
    <String, dynamic>{
      'list_id': instance.listId,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
      'containsFavoriteBook': instance.containsFavoriteBook,
    };
