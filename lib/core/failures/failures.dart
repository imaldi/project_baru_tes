import 'package:equatable/equatable.dart';

// part 'failures.g.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class NoInternetFailure extends Failure {}

class DataNotFoundFailure extends Failure {}

class RestApiFailure extends Failure {
  const RestApiFailure({this.code = 0, this.errorMessage = ""});
  final int code;
  final String errorMessage;

  @override
  List<Object?> get props => [];

  // factory RestApiFailure.fromJson(Map<String, Object?> json)
  // => _$RestApiFailureFromJson(json);
}
