import 'package:dynamic_multi_step_form/dynamic_multi_step_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pmc_main/features/authentication/providers/auth_provider.dart';
import 'package:pmc_main/features/authentication/views/signup_view.dart';

import '../../../Utils/app_colors.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_text_input.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(authProvider.notifier);
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextInput(
                radius: 15.0,
                hint: "Email Address",
                keyboard: TextInputType.emailAddress,
                controller: emailController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Email is invalid'),
                ]).call,
              ),
              const SizedBox(height: 20),
              CustomTextInput(
                radius: 15.0,
                hint: 'Password',
                secureText: true,
                controller: passwordController,
                validator: RequiredValidator(
                  errorText: 'Password is required',
                ).call,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.to(() => const ForgotPasswordView());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              CustomFilledButton(
                radius: 15,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    provider.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account?'),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => const SignupView());
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    wordSpacing: 2,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'By logging in or creating an account, you agree to PMC',
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('Terms of Service');
                        },
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('PrivacyPolicy');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
