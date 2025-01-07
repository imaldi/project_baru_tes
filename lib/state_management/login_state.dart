part of 'login_cubit.dart';

// TODO change to LoginCubitState
@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success() = _Success;
  const factory LoginState.failure(String? message) = _Failure;
  const factory LoginState.loggedIn() = _LoggedIn;
  const factory LoginState.loggedOut() = _LoggedOut;
}
