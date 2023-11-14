import 'package:flutter/material.dart';

class applebutton extends StatelessWidget {
  const applebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // print("login in buttom clicked");
        // if (!emailTextEditingController.text.contains("@")) {
        //   displayToastMessage("Email is not valid", context);
        // } else if (passwordTextEditingController.text.length < 2) {
        //   displayToastMessage(
        //       "please type correct password", context);
        // } else {
        //   loginAndAuthenticateUser(context);
        // }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: SizedBox(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/apple.png',
                cacheHeight: 32,
                cacheWidth: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Continue With Apple",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: "Brand Bold"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class googlebutton extends StatelessWidget {
  const googlebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // print("login in buttom clicked");
        // if (!emailTextEditingController.text.contains("@")) {
        //   displayToastMessage("Email is not valid", context);
        // } else if (passwordTextEditingController.text.length < 2) {
        //   displayToastMessage(
        //       "please type correct password", context);
        // } else {
        //   loginAndAuthenticateUser(context);
        // }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: SizedBox(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/google.png',
                cacheHeight: 32,
                cacheWidth: 32,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Continue With Google",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: "Brand Bold"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
