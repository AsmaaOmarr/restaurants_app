import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/utils/snak_bar.dart';
import 'package:mobile_assignment_1/core/utils/validation.dart';
import 'package:mobile_assignment_1/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:mobile_assignment_1/features/home/view/bottom_navbar.dart';
import 'package:mobile_assignment_1/features/home/view/home_view.dart';
import '../signup_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_pass_textField.dart';
import 'custom_spacer.dart';
import '../../../../../core/widgets/custom_textfield.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Image.asset("assets/images/login.png"),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "  LogIn",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    fontFamily: Constant.kFontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                onChanged: (value) {
                  email = value;
                  print(value);
                },
                validator: (value) => Validation.validateEmailLogin(
                  value,
                  "Email",
                ),
                icon: Icons.email_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              CustomPasswordTextField(
                label: 'Password',
                hint: 'Enter your password',
                onChanged: (value) {
                  password = value;
                  print(password);
                },
                validator: (value) =>
                    Validation.validateRequired(value, "Password"),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget password?   ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Constant.kMainColor,
                    fontFamily: Constant.kFontFamily,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              CustomButton(
                buttonName: "Login",
                onPressed: () async {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print(email);
                    print(password);
                    bool isEmailAndPasswordMatch = true;
                    // bool isEmailAndPasswordMatch =await SharedPreferencesService.doEmailAndPasswordMatch(
                    //         email!, password!);
                    print(isEmailAndPasswordMatch);
                    BlocProvider.of<AuthCubit>(context)
                        .signIn(email: email!, password: password!);

                    print("Login successfully");

                    if (isEmailAndPasswordMatch) {
                      SnakBar.showSnakBar(
                        context,
                        "Login successfully",
                        Colors.green,
                        Icons.check_circle,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBar(),
                        ),
                      );
                    } else {
                      SnakBar.showSnakBar(
                        context,
                        "Email and password don't match",
                        Colors.red,
                        Icons.error,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 40),
              const CustomSpacer(),
              const SizedBox(height: 40),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Don\'t have an account?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constant.kFontFamily,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ),
                      );
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Constant.kMainColor,
                        fontFamily: Constant.kFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
