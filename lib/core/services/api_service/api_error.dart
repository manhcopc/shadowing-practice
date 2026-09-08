import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../language/generated/l10n.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
sealed class ApiError with _$ApiError implements Exception {
  const ApiError._();

  const factory ApiError.plain({int? code, required String message}) = _Plain;
  const factory ApiError.server({int? code, required String message}) = _Server;
  const factory ApiError.network({int? code, required String message}) =
      _Network;
  const factory ApiError.internal(String message) = _Internal;
  const factory ApiError.cancelled() = _Cancelled;
  const factory ApiError.unexpected() = _Unexpected;
  const factory ApiError.unauthorized(String message) = _Unauthorized;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  String get displayMessage => maybeWhen(
    orElse: () => S.current.error_unexpected,
    plain: (code, message) => message,
    server: (code, message) => message,
    internal: (message) => message,
    network: (code, message) => message,
    unauthorized: (message) => message,
  );

  String get title => maybeWhen(
    plain: (code, message) => S.current.error,
    unauthorized: (message) => S.current.error_unauthorized,
    network: (code, message) => code == HttpStatus.internalServerError
        ? S.current.error_internal_server
        : S.current.error,
    orElse: () => S.current.error,
  );
}
