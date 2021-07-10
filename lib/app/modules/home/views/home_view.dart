import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bc.jpg"),
              fit: BoxFit.scaleDown,
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
                      SizedBox(
                        height: 10,
                      ),
                      emailtextfield(),
                      SizedBox(
                        height: 10,
                      ),
                      passwordtextfield(),
                      SizedBox(
                        height: 20,
                      ),
                      Custombutton(),
                      SizedBox(
                        height: 10,
                      ),
                      forget_signup(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomDivider(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSocialmedia()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField passwordtextfield() {
    return TextFormField(
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
          )),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  TextFormField emailtextfield() {
    return TextFormField(
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
      onSaved: (value) {},
      validator: (value) {},
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
        socialMedia(
          icon: FontAwesomeIcons.facebook,
        ),
        socialMedia(
          icon: FontAwesomeIcons.twitch,
        ),
        socialMedia(
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

class forget_signup extends StatelessWidget {
  const forget_signup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Forget Password?",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}

class Custombutton extends StatelessWidget {
  const Custombutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Login"),
      ),
    );
  }
}

class socialMedia extends StatelessWidget {
  const socialMedia({
    Key? key,
    this.icon,
  }) : super(key: key);
  final icon;

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
