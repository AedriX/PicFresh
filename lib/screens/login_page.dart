import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:picfresh/services/auth_service.dart';
import 'package:picfresh/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white]),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.030),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(logo, height: 45),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Hello, there!",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: fontColor.withOpacity(0.7),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    "Please log in using your \ngoogle account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: fontColor,
                    ),
                  ),
                ),
                Image.asset(image1),
                SizedBox(height: size.height * 0.024),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.080,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 82),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/google.png'),
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              "Login with Google",
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )),
                  onPressed: () {
                    AuthServices().signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
