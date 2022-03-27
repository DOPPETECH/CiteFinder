// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookingsRecord> _$bookingsRecordSerializer =
    new _$BookingsRecordSerializer();

class _$BookingsRecordSerializer
    implements StructuredSerializer<BookingsRecord> {
  @override
  final Iterable<Type> types = const [BookingsRecord, _$BookingsRecord];
  @override
  final String wireName = 'BookingsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BookingsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.room;
    if (value != null) {
      result
        ..add('room')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.dateBooked;
    if (value != null) {
      result
        ..add('date_booked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  BookingsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookingsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'room':
          result.room = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'date_booked':
          result.dateBooked = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$BookingsRecord extends BookingsRecord {
  @override
  final DocumentReference<Object> user;
  @override
  final DocumentReference<Object> room;
  @override
  final DateTime dateBooked;
  @override
  final String status;
  @override
  final DocumentReference<Object> reference;

  factory _$BookingsRecord([void Function(BookingsRecordBuilder) updates]) =>
      (new BookingsRecordBuilder()..update(updates)).build();

  _$BookingsRecord._(
      {this.user, this.room, this.dateBooked, this.status, this.reference})
      : super._();

  @override
  BookingsRecord rebuild(void Function(BookingsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookingsRecordBuilder toBuilder() =>
      new BookingsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookingsRecord &&
        user == other.user &&
        room == other.room &&
        dateBooked == other.dateBooked &&
        status == other.status &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, user.hashCode), room.hashCode), dateBooked.hashCode),
            status.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BookingsRecord')
          ..add('user', user)
          ..add('room', room)
          ..add('dateBooked', dateBooked)
          ..add('status', status)
          ..add('reference', reference))
        .toString();
  }
}

class BookingsRecordBuilder
    implements Builder<BookingsRecord, BookingsRecordBuilder> {
  _$BookingsRecord _$v;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DocumentReference<Object> _room;
  DocumentReference<Object> get room => _$this._room;
  set room(DocumentReference<Object> room) => _$this._room = room;

  DateTime _dateBooked;
  DateTime get dateBooked => _$this._dateBooked;
  set dateBooked(DateTime dateBooked) => _$this._dateBooked = dateBooked;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BookingsRecordBuilder() {
    BookingsRecord._initializeBuilder(this);
  }

  BookingsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _room = $v.room;
      _dateBooked = $v.dateBooked;
      _status = $v.status;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookingsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookingsRecord;
  }

  @override
  void update(void Function(BookingsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BookingsRecord build() {
    final _$result = _$v ??
        new _$BookingsRecord._(
            user: user,
            room: room,
            dateBooked: dateBooked,
            status: status,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
