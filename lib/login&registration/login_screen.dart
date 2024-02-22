import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/login&registration/color_utilis.dart';
import 'package:studentapp/login&registration/loginpageproperties/text_field2.dart';
import 'package:studentapp/login&registration/loginpageproperties/text_filed.dart';
import 'package:studentapp/login&registration/loginpageproperties/apple.dart';
import 'package:studentapp/login&registration/registrationscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:studentapp/main.dart';
import '../homeui/homeui.dart';
import 'package:text_divider/text_divider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  hexStringToColor("CB2B93"),
                  hexStringToColor("9546C4"),
                  hexStringToColor("5E61F4"),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  const Image(
                    image: AssetImage("assets/Icons/student.png"),
                    height: 250,
                    width: 250,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 1.0,
                  ),
                  const Text(
                    "Welcome To our app",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1.0,
                        ),
                        Textfiled1(
                            emailTextEditingController:
                                emailTextEditingController),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Textfiled2(
                            passwordTextEditingController:
                                passwordTextEditingController),
                        const SizedBox(
                          height: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print("login in buttom clicked");
                            if (!emailTextEditingController.text
                                .contains("@")) {
                              displayToastMessage(
                                  "Email is not valid", context);
                            } else if (passwordTextEditingController
                                    .text.length <
                                2) {
                              displayToastMessage(
                                  "please type correct password", context);
                            } else {
                              loginAndAuthenticateUser(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                          child: const SizedBox(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontFamily: "Brand Bold"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextDivider.horizontal(
                    color: Colors.black87,
                    thickness: 3.0,
                    text: const Text('or'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GoogleButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  const AppleButton(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Do not have account? Register Here.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future loginAndAuthenticateUser(BuildContext context) async {
    final userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text)
        .catchError((errMsg) {
      displayToastMessage("Error: $errMsg", context);
    });

    final firebaseUser = userCredential.user;
    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).once().then((DatabaseEvent snap) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeUi(),
          ),
        );
        displayToastMessage(
            "Welcome experience the best result with us", context);
      });
    } else {
      //error occur
      displayToastMessage("Error Can't sign in ", context);
    }
  }
}
