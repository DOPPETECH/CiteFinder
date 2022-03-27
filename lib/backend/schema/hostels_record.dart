import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'hostels_record.g.dart';

abstract class HostelsRecord
    implements Built<HostelsRecord, HostelsRecordBuilder> {
  static Serializer<HostelsRecord> get serializer => _$hostelsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'short_video')
  String get shortVideo;

  @nullable
  double get rating;

  @nullable
  LatLng get location;

  @nullable
  String get zone;

  @nullable
  @BuiltValueField(wireName: 'water_availability')
  String get waterAvailability;

  @nullable
  @BuiltValueField(wireName: 'electricity_availability')
  String get electricityAvailability;

  @nullable
  String get security;

  @nullable
  @BuiltValueField(wireName: 'main_image')
  String get mainImage;

  @nullable
  @BuiltValueField(wireName: 'date_added')
  DateTime get dateAdded;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HostelsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..shortVideo = ''
    ..rating = 0.0
    ..zone = ''
    ..waterAvailability = ''
    ..electricityAvailability = ''
    ..security = ''
    ..mainImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hostels');

  static Stream<HostelsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<HostelsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HostelsRecord._();
  factory HostelsRecord([void Function(HostelsRecordBuilder) updates]) =
      _$HostelsRecord;

  static HostelsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHostelsRecordData({
  String name,
  String description,
  String shortVideo,
  double rating,
  LatLng location,
  String zone,
  String waterAvailability,
  String electricityAvailability,
  String security,
  String mainImage,
  DateTime dateAdded,
}) =>
    serializers.toFirestore(
        HostelsRecord.serializer,
        HostelsRecord((h) => h
          ..name = name
          ..description = description
          ..shortVideo = shortVideo
          ..rating = rating
          ..location = location
          ..zone = zone
          ..waterAvailability = waterAvailability
          ..electricityAvailability = electricityAvailability
          ..security = security
          ..mainImage = mainImage
          ..dateAdded = dateAdded));
