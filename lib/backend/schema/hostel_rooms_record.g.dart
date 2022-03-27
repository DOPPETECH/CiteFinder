// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_rooms_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HostelRoomsRecord> _$hostelRoomsRecordSerializer =
    new _$HostelRoomsRecordSerializer();

class _$HostelRoomsRecordSerializer
    implements StructuredSerializer<HostelRoomsRecord> {
  @override
  final Iterable<Type> types = const [HostelRoomsRecord, _$HostelRoomsRecord];
  @override
  final String wireName = 'HostelRoomsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, HostelRoomsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.hostel;
    if (value != null) {
      result
        ..add('hostel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.numberAvailable;
    if (value != null) {
      result
        ..add('number_available')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  HostelRoomsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HostelRoomsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'hostel':
          result.hostel = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'number_available':
          result.numberAvailable = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$HostelRoomsRecord extends HostelRoomsRecord {
  @override
  final DocumentReference<Object> hostel;
  @override
  final String type;
  @override
  final BuiltList<String> images;
  @override
  final int numberAvailable;
  @override
  final String description;
  @override
  final double price;
  @override
  final DocumentReference<Object> reference;

  factory _$HostelRoomsRecord(
          [void Function(HostelRoomsRecordBuilder) updates]) =>
      (new HostelRoomsRecordBuilder()..update(updates)).build();

  _$HostelRoomsRecord._(
      {this.hostel,
      this.type,
      this.images,
      this.numberAvailable,
      this.description,
      this.price,
      this.reference})
      : super._();

  @override
  HostelRoomsRecord rebuild(void Function(HostelRoomsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HostelRoomsRecordBuilder toBuilder() =>
      new HostelRoomsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HostelRoomsRecord &&
        hostel == other.hostel &&
        type == other.type &&
        images == other.images &&
        numberAvailable == other.numberAvailable &&
        description == other.description &&
        price == other.price &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, hostel.hashCode), type.hashCode),
                        images.hashCode),
                    numberAvailable.hashCode),
                description.hashCode),
            price.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HostelRoomsRecord')
          ..add('hostel', hostel)
          ..add('type', type)
          ..add('images', images)
          ..add('numberAvailable', numberAvailable)
          ..add('description', description)
          ..add('price', price)
          ..add('reference', reference))
        .toString();
  }
}

class HostelRoomsRecordBuilder
    implements Builder<HostelRoomsRecord, HostelRoomsRecordBuilder> {
  _$HostelRoomsRecord _$v;

  DocumentReference<Object> _hostel;
  DocumentReference<Object> get hostel => _$this._hostel;
  set hostel(DocumentReference<Object> hostel) => _$this._hostel = hostel;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  int _numberAvailable;
  int get numberAvailable => _$this._numberAvailable;
  set numberAvailable(int numberAvailable) =>
      _$this._numberAvailable = numberAvailable;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HostelRoomsRecordBuilder() {
    HostelRoomsRecord._initializeBuilder(this);
  }

  HostelRoomsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hostel = $v.hostel;
      _type = $v.type;
      _images = $v.images?.toBuilder();
      _numberAvailable = $v.numberAvailable;
      _description = $v.description;
      _price = $v.price;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HostelRoomsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HostelRoomsRecord;
  }

  @override
  void update(void Function(HostelRoomsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HostelRoomsRecord build() {
    _$HostelRoomsRecord _$result;
    try {
      _$result = _$v ??
          new _$HostelRoomsRecord._(
              hostel: hostel,
              type: type,
              images: _images?.build(),
              numberAvailable: numberAvailable,
              description: description,
              price: price,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HostelRoomsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
