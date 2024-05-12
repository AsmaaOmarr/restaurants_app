import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_assignment_1/core/models/user.dart';
import 'package:mobile_assignment_1/features/auth/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepo authRepo = AuthRepo();

  Future<void> signUp({required User user}) async {
    try {
      emit(SignUpLoading());
      var result = await authRepo.signUp(user: user);
      result.fold(
        (l) => emit(
          SignUpFailed(msg: l),
        ),
        (r) => emit(
          SignUpSuccess(msg: r),
        ),
      );
    } catch (e) {
      print("Error: $e");
      emit(SignUpFailed(msg: e.toString()));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      var result = await authRepo.signIn(email: email, password: password);
      result.fold(
        (l) => emit(
          LoginFailed(msg: l),
        ),
        (r) => emit(
          LoginSuccess(msg: r),
        ),
      );
    } catch (e) {
      print("Error: $e");
      emit(LoginFailed(msg: e.toString()));
    }
  }
}
