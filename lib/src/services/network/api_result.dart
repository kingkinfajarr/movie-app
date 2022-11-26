import 'package:elemes_id_test/src/exceptions/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;

  const factory ApiResult.failure(
      NetworkExceptions error, StackTrace stacktrace) = Failure<T>;
}
