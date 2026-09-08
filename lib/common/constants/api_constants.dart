/// [APIConstants] file contains the variables default a path in url
/// to request API.
class APIConstants {
  APIConstants._();

  // Auth API
  static const String pathLogin = "/auth-services/login";
  static const String pathSignUp = "/auth-services/register";
  static const String pathRefreshToken = "/auth-services/refresh-token";
  // User API
  static const String pathGetProfile = "/user-services/me";
}
