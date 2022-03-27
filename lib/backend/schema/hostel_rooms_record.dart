import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hostel_rooms_record.g.dart';

abstract class HostelRoomsRecord
    implements Built<HostelRoomsRecord, HostelRoomsRecordBuilder> {
  static Serializer<HostelRoomsRecord> get serializer =>
      _$hostelRoomsRecordSerializer;

  @nullable
  DocumentReference get hostel;

  @nullable
  String get type;

  @nullable
  BuiltList<String> get images;

  @nullable
  @BuiltValueField(wireName: 'number_available')
  int get numberAvailable;

  @nullable
  String get description;

  @nullable
  double get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HostelRoomsRecordBuilder builder) => builder
    ..type = ''
    ..images = ListBuilder()
    ..numberAvailable = 0
    ..description = ''
    ..price = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hostel_rooms');

  static Stream<HostelRoomsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<HostelRoomsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HostelRoomsRecord._();
  factory HostelRoomsRecord([void Function(HostelRoomsRecordBuilder) updates]) =
      _$HostelRoomsRecord;

  static HostelRoomsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHostelRoomsRecordData({
  DocumentReference hostel,
  String type,
  int numberAvailable,
  String description,
  double price,
}) =>
    serializers.toFirestore(
        HostelRoomsRecord.serializer,
        HostelRoomsRecord((h) => h
          ..hostel = hostel
          ..type = type
          ..images = null
          ..numberAvailable = numberAvailable
          ..description = description
          ..price = price));
