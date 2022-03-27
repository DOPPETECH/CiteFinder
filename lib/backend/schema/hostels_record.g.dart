// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostels_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HostelsRecord> _$hostelsRecordSerializer =
    new _$HostelsRecordSerializer();

class _$HostelsRecordSerializer implements StructuredSerializer<HostelsRecord> {
  @override
  final Iterable<Type> types = const [HostelsRecord, _$HostelsRecord];
  @override
  final String wireName = 'HostelsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, HostelsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shortVideo;
    if (value != null) {
      result
        ..add('short_video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.zone;
    if (value != null) {
      result
        ..add('zone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.waterAvailability;
    if (value != null) {
      result
        ..add('water_availability')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.electricityAvailability;
    if (value != null) {
      result
        ..add('electricity_availability')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.security;
    if (value != null) {
      result
        ..add('security')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mainImage;
    if (value != null) {
      result
        ..add('main_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateAdded;
    if (value != null) {
      result
        ..add('date_added')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  HostelsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HostelsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'short_video':
          result.shortVideo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'zone':
          result.zone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'water_availability':
          result.waterAvailability = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'electricity_availability':
          result.electricityAvailability = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'security':
          result.security = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'main_image':
          result.mainImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_added':
          result.dateAdded = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$HostelsRecord extends HostelsRecord {
  @override
  final String name;
  @override
  final String description;
  @override
  final String shortVideo;
  @override
  final double rating;
  @override
  final LatLng location;
  @override
  final String zone;
  @override
  final String waterAvailability;
  @override
  final String electricityAvailability;
  @override
  final String security;
  @override
  final String mainImage;
  @override
  final DateTime dateAdded;
  @override
  final DocumentReference<Object> reference;

  factory _$HostelsRecord([void Function(HostelsRecordBuilder) updates]) =>
      (new HostelsRecordBuilder()..update(updates)).build();

  _$HostelsRecord._(
      {this.name,
      this.description,
      this.shortVideo,
      this.rating,
      this.location,
      this.zone,
      this.waterAvailability,
      this.electricityAvailability,
      this.security,
      this.mainImage,
      this.dateAdded,
      this.reference})
      : super._();

  @override
  HostelsRecord rebuild(void Function(HostelsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HostelsRecordBuilder toBuilder() => new HostelsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HostelsRecord &&
        name == other.name &&
        description == other.description &&
        shortVideo == other.shortVideo &&
        rating == other.rating &&
        location == other.location &&
        zone == other.zone &&
        waterAvailability == other.waterAvailability &&
        electricityAvailability == other.electricityAvailability &&
        security == other.security &&
        mainImage == other.mainImage &&
        dateAdded == other.dateAdded &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                description.hashCode),
                                            shortVideo.hashCode),
                                        rating.hashCode),
                                    location.hashCode),
                                zone.hashCode),
                            waterAvailability.hashCode),
                        electricityAvailability.hashCode),
                    security.hashCode),
                mainImage.hashCode),
            dateAdded.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HostelsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('shortVideo', shortVideo)
          ..add('rating', rating)
          ..add('location', location)
          ..add('zone', zone)
          ..add('waterAvailability', waterAvailability)
          ..add('electricityAvailability', electricityAvailability)
          ..add('security', security)
          ..add('mainImage', mainImage)
          ..add('dateAdded', dateAdded)
          ..add('reference', reference))
        .toString();
  }
}

class HostelsRecordBuilder
    implements Builder<HostelsRecord, HostelsRecordBuilder> {
  _$HostelsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _shortVideo;
  String get shortVideo => _$this._shortVideo;
  set shortVideo(String shortVideo) => _$this._shortVideo = shortVideo;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  LatLng _location;
  LatLng get location => _$this._location;
  set location(LatLng location) => _$this._location = location;

  String _zone;
  String get zone => _$this._zone;
  set zone(String zone) => _$this._zone = zone;

  String _waterAvailability;
  String get waterAvailability => _$this._waterAvailability;
  set waterAvailability(String waterAvailability) =>
      _$this._waterAvailability = waterAvailability;

  String _electricityAvailability;
  String get electricityAvailability => _$this._electricityAvailability;
  set electricityAvailability(String electricityAvailability) =>
      _$this._electricityAvailability = electricityAvailability;

  String _security;
  String get security => _$this._security;
  set security(String security) => _$this._security = security;

  String _mainImage;
  String get mainImage => _$this._mainImage;
  set mainImage(String mainImage) => _$this._mainImage = mainImage;

  DateTime _dateAdded;
  DateTime get dateAdded => _$this._dateAdded;
  set dateAdded(DateTime dateAdded) => _$this._dateAdded = dateAdded;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HostelsRecordBuilder() {
    HostelsRecord._initializeBuilder(this);
  }

  HostelsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _shortVideo = $v.shortVideo;
      _rating = $v.rating;
      _location = $v.location;
      _zone = $v.zone;
      _waterAvailability = $v.waterAvailability;
      _electricityAvailability = $v.electricityAvailability;
      _security = $v.security;
      _mainImage = $v.mainImage;
      _dateAdded = $v.dateAdded;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HostelsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HostelsRecord;
  }

  @override
  void update(void Function(HostelsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HostelsRecord build() {
    final _$result = _$v ??
        new _$HostelsRecord._(
            name: name,
            description: description,
            shortVideo: shortVideo,
            rating: rating,
            location: location,
            zone: zone,
            waterAvailability: waterAvailability,
            electricityAvailability: electricityAvailability,
            security: security,
            mainImage: mainImage,
            dateAdded: dateAdded,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
