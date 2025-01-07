import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_baru_tes/repository/register_repository.dart';

part 'registration_state.dart';
part 'registration_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegistrationState> {
  RegisterCubit({required this.repo})
      : super(const RegistrationState.initial());

  final RegisterRepository repo;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String role,
    required String phone,
    required String address,
    String? referralCode,
  }) async {
    emit(const RegistrationState.loading());

    var result = await repo.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      role: role,
      phone: phone,
      address: address,
      referralCode: referralCode,
    );

    result.fold(
      (failure) {
        // emit(RegistrationState.failure(message: failure.errorMessage));
      },
      (success) {
        emit(const RegistrationState.success());
      },
    );
  }
}
