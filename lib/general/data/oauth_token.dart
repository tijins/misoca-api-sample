import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_token.freezed.dart';

part 'oauth_token.g.dart';

@freezed
class OauthToken with _$OauthToken {
  const factory OauthToken(
      @JsonKey(name: "access_token") String accessToken,
      @JsonKey(name: "refresh_token") String refreshToken,
      String scope,
      @JsonKey(name: "token_type") String tokenType,
      @JsonKey(name: "expires_in") int expiresIn,
      @JsonKey(name: "created_at") int createdAt) = _OauthToken;

  factory OauthToken.fromJson(Map<String, dynamic> json) => _$OauthTokenFromJson(json);
}
