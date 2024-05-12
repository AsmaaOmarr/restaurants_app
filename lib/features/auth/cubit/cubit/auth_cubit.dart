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
      emit(SignUpSuccess());
    } catch (e) {
      print("Error: $e");
      emit(SignUpFailed());
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      var result = await authRepo.signIn(email: email, password: password);

      emit(LoginSuccess());
    } catch (e) {
      print("Error: $e");
      emit(LoginFailed());
    }
  }
}
