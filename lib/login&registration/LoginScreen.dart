import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/login&registration/color_utilis.dart';
import 'package:studentapp/login&registration/registrationscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:studentapp/main.dart';
import '../homeui/homeui.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.12,
                ),
                const Image(
                  image: AssetImage("assets/Icons/student.png"),
                  height: 360,
                  width: 350,
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
                      TextField(
                        controller: emailTextEditingController,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      TextField(
                        controller: passwordTextEditingController,
                        cursorColor: Colors.white,
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // print("login in buttom clicked");
                          if (!emailTextEditingController.text.contains("@")) {
                            displayToastMessage("Email is not valid", context);
                          } else if (passwordTextEditingController.text.length <
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
                            )),
                        child: const SizedBox(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30.0,
                                  fontFamily: "Brand Bold"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
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
        if (snap != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeUi(),
            ),
          );
          displayToastMessage(
              "Welcome experience the best result with us", context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              'No record exit please create new account', context);
        }
      });
    } else {
      //error occur
      displayToastMessage("Error Can't sign in ", context);
    }
  }
}
