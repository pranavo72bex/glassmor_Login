import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmor_login/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bc.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.04,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0.1,
                    ),
                    color: Colors.black.withOpacity(0.02),
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomsizeBox(height: 10),
                        FormBuilderTextField(
                          name: 'email',
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                          validator: FormBuilderValidators.email(
                            errorText: (ValidatorMessage.emailValidation),
                          ),
                        ),
                        CustomsizeBox(height: 10),
                        FormBuilderTextField(
                          name: 'password',
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_outlined,
                            ),
                          ),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText:
                                    (ValidatorMessage.requiredValidation),
                              ),
                              FormBuilderValidators.match(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                errorText: ValidatorMessage.regexValidation,
                              ),
                            ],
                          ),
                        ),
                        CustomsizeBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (!formKey.currentState!.saveAndValidate()) {
                                return;
                              }
                            },
                            child: Text("Login"),
                          ),
                        ),
                        CustomsizeBox(height: 20),
                        ForgetSignup(),
                        CustomsizeBox(height: 20),
                        CustomDivider(),
                        CustomsizeBox(height: 20),
                        CustomSocialmedia()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ValidatorMessage {
  const ValidatorMessage._private();

  static const emailValidation = 'Enter a Valid Email';
  static const passwordValidation = 'Enter a Valid Password';
  static const requiredValidation = 'Required';
  static const regexValidation = "regexValidation";
}

class CustomsizeBox extends StatelessWidget {
  const CustomsizeBox({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class CustomSocialmedia extends StatelessWidget {
  const CustomSocialmedia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialMedia(
          icon: FontAwesomeIcons.facebook,
        ),
        SocialMedia(
          icon: FontAwesomeIcons.twitch,
        ),
        SocialMedia(
          icon: FontAwesomeIcons.twitter,
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: Divider(
        color: Colors.white,
      )),
      Text(
        "OR",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      Expanded(
          child: Divider(
        color: Colors.white,
      )),
    ]);
  }
}

class ForgetSignup extends StatelessWidget {
  const ForgetSignup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: 'Forget Password?'),
        CustomText(text: 'Sign Up'),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 15,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
