// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
class _$QuotesModelTearOff {
  const _$QuotesModelTearOff();

  _QuotesModel call(@JsonKey(name: 'content') String text, String author) {
    return _QuotesModel(
      text,
      author,
    );
  }

  QuotesModel fromJson(Map<String, Object?> json) {
    return QuotesModel.fromJson(json);
  }
}

/// @nodoc
const $QuotesModel = _$QuotesModelTearOff();

/// @nodoc
mixin _$QuotesModel {
  @JsonKey(name: 'content')
  String get text => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'content') String text, String author});
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res> implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

  final QuotesModel _value;
  // ignore: unused_field
  final $Res Function(QuotesModel) _then;

  @override
  $Res call({
    Object? text = freezed,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QuotesModelCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$QuotesModelCopyWith(
          _QuotesModel value, $Res Function(_QuotesModel) then) =
      __$QuotesModelCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'content') String text, String author});
}

/// @nodoc
class __$QuotesModelCopyWithImpl<$Res> extends _$QuotesModelCopyWithImpl<$Res>
    implements _$QuotesModelCopyWith<$Res> {
  __$QuotesModelCopyWithImpl(
      _QuotesModel _value, $Res Function(_QuotesModel) _then)
      : super(_value, (v) => _then(v as _QuotesModel));

  @override
  _QuotesModel get _value => super._value as _QuotesModel;

  @override
  $Res call({
    Object? text = freezed,
    Object? author = freezed,
  }) {
    return _then(_QuotesModel(
      text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuotesModel implements _QuotesModel {
  _$_QuotesModel(@JsonKey(name: 'content') this.text, this.author);

  factory _$_QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuotesModelFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String text;
  @override
  final String author;

  @override
  String toString() {
    return 'QuotesModel(text: $text, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuotesModel &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.author, author));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(author));

  @JsonKey(ignore: true)
  @override
  _$QuotesModelCopyWith<_QuotesModel> get copyWith =>
      __$QuotesModelCopyWithImpl<_QuotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotesModelToJson(this);
  }
}

abstract class _QuotesModel implements QuotesModel {
  factory _QuotesModel(@JsonKey(name: 'content') String text, String author) =
      _$_QuotesModel;

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$_QuotesModel.fromJson;

  @override
  @JsonKey(name: 'content')
  String get text;
  @override
  String get author;
  @override
  @JsonKey(ignore: true)
  _$QuotesModelCopyWith<_QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
