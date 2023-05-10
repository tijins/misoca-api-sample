// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OauthToken _$OauthTokenFromJson(Map<String, dynamic> json) {
  return _OauthToken.fromJson(json);
}

/// @nodoc
mixin _$OauthToken {
  @JsonKey(name: "access_token")
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "refresh_token")
  String get refreshToken => throw _privateConstructorUsedError;
  String get scope => throw _privateConstructorUsedError;
  @JsonKey(name: "token_type")
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: "expires_in")
  int get expiresIn => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  int get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OauthTokenCopyWith<OauthToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OauthTokenCopyWith<$Res> {
  factory $OauthTokenCopyWith(
          OauthToken value, $Res Function(OauthToken) then) =
      _$OauthTokenCopyWithImpl<$Res, OauthToken>;
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "refresh_token") String refreshToken,
      String scope,
      @JsonKey(name: "token_type") String tokenType,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "created_at") int createdAt});
}

/// @nodoc
class _$OauthTokenCopyWithImpl<$Res, $Val extends OauthToken>
    implements $OauthTokenCopyWith<$Res> {
  _$OauthTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? scope = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OauthTokenCopyWith<$Res>
    implements $OauthTokenCopyWith<$Res> {
  factory _$$_OauthTokenCopyWith(
          _$_OauthToken value, $Res Function(_$_OauthToken) then) =
      __$$_OauthTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "refresh_token") String refreshToken,
      String scope,
      @JsonKey(name: "token_type") String tokenType,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "created_at") int createdAt});
}

/// @nodoc
class __$$_OauthTokenCopyWithImpl<$Res>
    extends _$OauthTokenCopyWithImpl<$Res, _$_OauthToken>
    implements _$$_OauthTokenCopyWith<$Res> {
  __$$_OauthTokenCopyWithImpl(
      _$_OauthToken _value, $Res Function(_$_OauthToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? scope = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? createdAt = null,
  }) {
    return _then(_$_OauthToken(
      null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OauthToken implements _OauthToken {
  const _$_OauthToken(
      @JsonKey(name: "access_token") this.accessToken,
      @JsonKey(name: "refresh_token") this.refreshToken,
      this.scope,
      @JsonKey(name: "token_type") this.tokenType,
      @JsonKey(name: "expires_in") this.expiresIn,
      @JsonKey(name: "created_at") this.createdAt);

  factory _$_OauthToken.fromJson(Map<String, dynamic> json) =>
      _$$_OauthTokenFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String accessToken;
  @override
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @override
  final String scope;
  @override
  @JsonKey(name: "token_type")
  final String tokenType;
  @override
  @JsonKey(name: "expires_in")
  final int expiresIn;
  @override
  @JsonKey(name: "created_at")
  final int createdAt;

  @override
  String toString() {
    return 'OauthToken(accessToken: $accessToken, refreshToken: $refreshToken, scope: $scope, tokenType: $tokenType, expiresIn: $expiresIn, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OauthToken &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken, scope,
      tokenType, expiresIn, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OauthTokenCopyWith<_$_OauthToken> get copyWith =>
      __$$_OauthTokenCopyWithImpl<_$_OauthToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OauthTokenToJson(
      this,
    );
  }
}

abstract class _OauthToken implements OauthToken {
  const factory _OauthToken(
      @JsonKey(name: "access_token") final String accessToken,
      @JsonKey(name: "refresh_token") final String refreshToken,
      final String scope,
      @JsonKey(name: "token_type") final String tokenType,
      @JsonKey(name: "expires_in") final int expiresIn,
      @JsonKey(name: "created_at") final int createdAt) = _$_OauthToken;

  factory _OauthToken.fromJson(Map<String, dynamic> json) =
      _$_OauthToken.fromJson;

  @override
  @JsonKey(name: "access_token")
  String get accessToken;
  @override
  @JsonKey(name: "refresh_token")
  String get refreshToken;
  @override
  String get scope;
  @override
  @JsonKey(name: "token_type")
  String get tokenType;
  @override
  @JsonKey(name: "expires_in")
  int get expiresIn;
  @override
  @JsonKey(name: "created_at")
  int get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OauthTokenCopyWith<_$_OauthToken> get copyWith =>
      throw _privateConstructorUsedError;
}
