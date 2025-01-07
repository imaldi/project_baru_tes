import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_baru_tes/repository/login_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repo}) : super(const LoginState.loggedOut());

  final LoginRepository repo;

  Future<void> login(String email, String password) async {
    emit(const LoginState.loading());
    var result = await repo.login(email, password);

    result.fold(
      (failure) {
        // emit(const LoginState.failed());
      },
      (success) async {
        emit(const LoginState.success());
      },
    );
  }
}
