import 'package:picfresh/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: size.height * 0.15,
            bottom: size.height * 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/google.png'),
                  height: 80,
                ),
                Text(
                  "Logo PicFresh",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            const Text("Quotes", style: TextStyle(fontSize: 20)),
            GestureDetector(
                onTap: () {
                  AuthServices().signInWithGoogle();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 60,
                  width: 250,
                  padding: const EdgeInsets.all(5),
                  child: const Center(
                    child: Row(
                      children: [
                        Text("Sign in with Google"),
                        Image(
                          image: AssetImage('assets/google.png'),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
