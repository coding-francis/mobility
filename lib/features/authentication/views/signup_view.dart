import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/data.dart';
import '../../../widgets/custom_filled_button.dart';
import '../../../widgets/custom_text_input.dart';
import '../models/user_registration_model.dart';
import '../providers/auth_provider.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final GlobalKey<FormState> _personalInformationFormKey = GlobalKey();
  final GlobalKey<FormState> _addressFormKey = GlobalKey();
  final GlobalKey<FormState> _contactAndSecurityFormKey = GlobalKey();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();

  TextEditingController countryController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController digitalAddressController = TextEditingController();

  bool agreedToTerms = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  int _currentStep = 0;
  String selectedRole = 'USER';
  String selectedCountry = '';
  String selectedRegion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep == 0) {
                  FocusScope.of(context).unfocus();
                  if (_personalInformationFormKey.currentState!.validate()) {
                    setState(() {
                      if (_currentStep < 2) {
                        _currentStep += 1;
                      } else {}
                    });
                  }
                } else if (_currentStep == 1) {
                  FocusScope.of(context).unfocus();
                  if (_addressFormKey.currentState!.validate()) {
                    setState(() {
                      if (_currentStep < 2) {
                        _currentStep += 1;
                      } else {}
                    });
                  }
                } else {
                  FocusScope.of(context).unfocus();
                  if (_contactAndSecurityFormKey.currentState!.validate()) {
                    _showTermsAndConditionsModal(context);
                  }
                }
              },
              onStepCancel: () {
                setState(() {
                  if (_currentStep > 0) {
                    _currentStep -= 1;
                  }
                });
              },
              onStepTapped: (int tapped) {
                if (tapped < _currentStep) {
                  setState(() {
                    _currentStep = tapped;
                  });
                }
              },
              steps: <Step>[
                Step(
                  title: const Text('Personal Information'),
                  subtitle:
                      const Text("lorem ipsum text describing this process"),
                  content: Form(
                    key: _personalInformationFormKey,
                    child: Column(
                      children: [
                        CustomTextInput(
                          radius: 15.0,
                          hint: "First name",
                          controller: firstNameController,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please provide your firstname")
                          ]).call,
                        ),
                        const SizedBox(height: 20),
                        CustomTextInput(
                          radius: 15.0,
                          hint: "Middle name",
                          controller: middleNameController,
                        ),
                        const SizedBox(height: 20),
                        CustomTextInput(
                          radius: 15.0,
                          hint: "Last name",
                          controller: lastNameController,
                          validator: MultiValidator([
                            RequiredValidator(
                              errorText: "Please provide your lastname",
                            )
                          ]).call,
                        ),
                      ],
                    ),
                  ),
                  isActive: _currentStep == 0,
                ),
                Step(
                  title: const Text('Address'),
                  subtitle:
                      const Text("lorem ipsum text describing this process"),
                  content: Form(
                    key: _addressFormKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TypeAheadField(
                          controller: countryController,
                          suggestionsCallback: (pattern) {
                            return countriesList
                                .where((country) => country
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                              controller: countryController,
                              focusNode: focusNode,
                              autofocus: true,
                              decoration: InputDecoration(
                                labelText: "Country",
                                hintText:
                                    'Please select your country of residence',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              countryController.text = suggestion;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        TypeAheadField(
                          controller: regionController,
                          suggestionsCallback: (pattern) {
                            return ghanaRegionsList
                                .where((region) => region
                                    .toLowerCase()
                                    .contains(pattern.toLowerCase()))
                                .toList();
                          },
                          builder: (context, controller, focusNode) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              autofocus: true,
                              decoration: InputDecoration(
                                labelText: "Region",
                                hintText:
                                    'Please select your region of residence',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            );
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion),
                            );
                          },
                          onSelected: (suggestion) {
                            setState(() {
                              regionController.text = suggestion;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextInput(
                            radius: 15.0,
                            hint: "City",
                            // label: "City",
                            controller: cityController,
                            validator: MultiValidator([
                              RequiredValidator(
                                errorText: "Please provide your city",
                              )
                            ]).call),
                        const SizedBox(height: 20),
                        CustomTextInput(
                            radius: 15.0,
                            hint: "Street Address",
                            controller: streetAddressController,
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText:
                                      "Please provide your street address")
                            ]).call),
                        const SizedBox(height: 20),
                        CustomTextInput(
                          radius: 15.0,
                          hint: "Digital address",
                          controller: digitalAddressController,
                        ),
                      ],
                    ),
                  ),
                  isActive: _currentStep == 1,
                ),
                Step(
                  title: const Text('Contact and Security'),
                  subtitle:
                      const Text("lorem ipsum text describing this process"),
                  content: Form(
                    key: _contactAndSecurityFormKey,
                    child: Column(
                      children: [
                        CustomTextInput(
                          radius: 15.0,
                          hint: "Phone number",
                          keyboard: TextInputType.phone,
                          controller: phoneController,
                          // validator: MultiValidator([
                          //   RequiredValidator(
                          //       errorText: 'Phone number is required'),
                          // ]).call,
                        ),
                        const SizedBox(height: 20),
                        CustomTextInput(
                          radius: 15.0,
                          hint: "Email Address",
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
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please provide your password"),
                          ]).call,
                        ),
                        const SizedBox(height: 20),
                        CustomTextInput(
                          radius: 15.0,
                          hint: 'Confirm Password',
                          secureText: true,
                          controller: confirmPasswordController,
                          validator: (val) => MatchValidator(
                                  errorText: 'Passwords do not match')
                              .validateMatch(
                            val!,
                            passwordController.text,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  isActive: _currentStep == 3,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showTermsAndConditionsModal(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final provider = ref.read(authProvider.notifier);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('(Last Updated 01-Mar-2024)'),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Please read this agreement carefully',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(),
                    const Text(
                      'PMC (Property Management Console) End User License Agreement (EULA)',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '1. Introduction',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "This End User License Agreement ('EULA') is a legal contract between you (either an individual or a single entity) and PMC for the PMC software product. This product includes computer software, associated media, printed materials, and online or electronic documentation ('Software'). By signing up, copying, or otherwise using the Software, you agree to be bound by the terms of this EULA. This agreement represents the entire agreement concerning the Software between you and PMC, and it supersedes any prior proposal, representation, or understanding between the parties.",
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '2. License Grant',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "PMC hereby grants you a non-exclusive, non-transferable, limited license to use the Software solution. This license is granted solely for your personal or business operations on a single computer or network. You are not permitted to rent, lease, lend, sell, redistribute, sublicense, or otherwise commercially exploit the Software. Unauthorized copying, decompiling, reverse-engineering, disassembling, modification, or creation of derivative works of the Software is prohibited. The Software is licensed as a single product, and its component parts may not be separated for use on more than one computer.",
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      '3. User Obligations',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. You must notify PMC immediately of any unauthorized use of your account or any other breach of security. You must provide accurate, current, and complete information as prompted by any registration forms on the Software. Impersonation of any person or entity, or falsely stating or misrepresenting your identity or affiliation with a person or entity, is prohibited.",
                    ),
                    const Text(
                      '4. Data Collection and Privacy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "PMC respects your privacy rights and recognizes the importance of protecting any information collected about you. The Software may collect personal data such as your name, address, telephone number, and e-mail address. This information will be used to provide services and support, to communicate with you, and to comply with legal requirements. Additionally, PMC may collect and use metrics from the application to drive productivity and improve the Software. PMC is committed to ensuring that your information is secure and will be handled in accordance with our privacy policy."),
                    const SizedBox(height: 10.0),
                    const Text(
                      '5. Intellectual Property Rights',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "PMC and its licensors own all rights, title, and interest in and to the PMC Software and any associated intellectual property. This EULA does not transfer any ownership rights to you. Unauthorized reproduction, reverse engineering, transmission, public performance, rental, or circumvention of copy protection is strictly prohibited. You agree to respect PMC's intellectual property rights and will refrain from any action that could harm them."),
                    const SizedBox(height: 10.0),
                    const Text(
                      '6. Disclaimer of Warranties',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "PMC provides the Software 'as is' and with all faults, disclaiming all other warranties and conditions, whether express, implied, or statutory. This includes warranties of merchantability, fitness for a particular purpose, and non-infringement. PMC does not guarantee that the Software will meet your requirements, will operate in the combinations you may select for use, will be error-free, or will be uninterrupted."),
                    const SizedBox(height: 10.0),
                    const Text(
                      '7. Limitation of Liability',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "In no event will PMC or its affiliates be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of the Software. This includes, but is not limited to, damages for loss of profits, data, goodwill, or other intangible losses. The limitations apply regardless of whether such damages were foreseeable and whether PMC was advised of the possibility of such damages."),
                    const SizedBox(height: 10.0),
                    const Text(
                      '8. Termination',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "This EULA is effective until terminated. It may be terminated by either you or PMC at any time and for any reason. Upon termination, you must cease all use of the Software and destroy all copies. PMC reserves the right to discontinue any aspect of the Software at any time."),
                    const SizedBox(height: 10.0),
                    const Text(
                      '9. Governing Law',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                        "This EULA and your use of the Software will be governed by and construed in accordance with the laws of the jurisdiction in which the Software is used. Any dispute arising out of or related to this EULA or the Software will be subject to the exclusive jurisdiction of the courts of that jurisdiction."),
                    const SizedBox(height: 10.0),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          height: 1.5,
                          wordSpacing: 2,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By checking the box, you agree to our',
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
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Checkbox(
                          value: agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreedToTerms = value!;
                            });
                          },
                        ),
                        const Text(
                          'I agree with the terms and conditions.',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    CustomFilledButton(
                      disabled: !agreedToTerms,
                      onPressed: () async {
                        // Navigator.pop(context);
                        UserRegistrationModel registrationData =
                            UserRegistrationModel(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          middleName: middleNameController.text,
                          emailAddress: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneController.text,
                          role: selectedRole,
                          country: countryController.text,
                          state: regionController.text,
                          city: cityController.text,
                          location: streetAddressController.text,
                        );
                        debugPrint(selectedRole);
                        provider.signup(registrationData);
                      },
                      radius: 50.0,
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
