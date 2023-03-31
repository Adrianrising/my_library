// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_books_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShelfBooksVOAdapter extends TypeAdapter<ShelfBooksVO> {
  @override
  final int typeId = 5;

  @override
  ShelfBooksVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShelfBooksVO(
      fields[0] as String?,
      (fields[1] as List?)?.cast<BooksVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShelfBooksVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.shelfName)
      ..writeByte(1)
      ..write(obj.books);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShelfBooksVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShelfBooksVO _$ShelfBooksVOFromJson(Map<String, dynamic> json) => ShelfBooksVO(
      json['shelf_name'] as String?,
      (json['books'] as List<dynamic>?)
          ?.map((e) => BooksVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShelfBooksVOToJson(ShelfBooksVO instance) =>
    <String, dynamic>{
      'shelf_name': instance.shelfName,
      'books': instance.books,
    };
