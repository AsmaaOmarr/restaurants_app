import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:mobile_assignment_1/features/home/view/bottom_navbar.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              return BottomNavBar();
            }
            return const LoginViewBody();
          },
        ),
      ),
    );
  }
}
