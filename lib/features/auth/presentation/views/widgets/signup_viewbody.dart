import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/login_view.dart';
import 'package:mobile_assignment_1/core/models/user.dart';
import 'package:mobile_assignment_1/core/utils/snak_bar.dart';
import 'package:mobile_assignment_1/core/widgets/custom_button.dart';
import 'package:mobile_assignment_1/core/widgets/custom_pass_textField.dart';
import 'package:mobile_assignment_1/features/auth/presentation/views/widgets/custom_spacer.dart';
import 'package:mobile_assignment_1/core/utils/validation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/Gender_selection.dart';
import '../../../../../core/widgets/custom_dropdown.dart';
import '../../../../../core/widgets/custom_textfield.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? fullName, email, password, gender, cPassword;
  int? level = 0;
  bool showEmailExist = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          setState(() => isLoading = true);
        } else if (state is SignUpFailed) {
          setState(() => isLoading = false);
          SnakBar.showSnakBar(context, "email already exists", Colors.red,
              Icons.error_outline_rounded);
        } else if (state is SignUpSuccess) {
          SnakBar.showSnakBar(
              context, "Sign up Success", Colors.green, Icons.check_circle);
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
        }
      },
      child: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset("assets/images/signup.png"),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "  SignUp",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        fontFamily: Constant.kFontFamily,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Full name',
                    hint: 'Enter your full name',
                    onChanged: (value) {
                      fullName = value;
                      print(fullName);
                    },
                    validator: (value) => Validation.validateRequired(
                      value,
                      "Name",
                    ),
                    icon: Icons.person_2_rounded,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    label: 'Email',
                    hint: 'asmaa@gmail.com',
                    onChanged: (value) {
                      email = value;
                      print(value);
                    },
                    validator: (value) => Validation.validateEmailSignUp(
                      value,
                      "Email",
                      showEmailExist,
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
                        Validation.validatePassword(value, "Password"),
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    label: 'Confirm password',
                    hint: 'Rewrite your password',
                    onChanged: (value) {
                      cPassword = value;
                      print(cPassword);
                    },
                    validator: (value) => Validation.validateConfirmPassword(
                        value, password, "Confirm Password"),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "  Gender",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.kFontFamily,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // initial like "female" or "male"
                      GenderSelection(
                        initialSelection: "",
                        onChanged: (String value) {
                          gender = value;
                          print(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CustomDropdownButton(
                    value: level,
                    onChanged: (value) {
                      setState(() {
                        level = value;
                      });
                      print(value);
                    },
                  ),
                  const SizedBox(height: 38),
                  CustomButton(
                    buttonName: "Sign Up",
                    onPressed: () async {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        User user = User(
                          name: fullName!,
                          email: email!,
                          password: password!,
                          gender: gender,
                          level: level == 0 ? 1 : level,
                          confirmPassword: cPassword!,
                        );
                        print("user = ${user.toJson()}");
                        BlocProvider.of<AuthCubit>(context).signUp(user: user);
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
                        "Joined us before?",
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
                              builder: (context) => const LoginView(),
                            ),
                          );
                        },
                        child: const Text(
                          " Log In",
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
                  const SizedBox(height: 40),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
