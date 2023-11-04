import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:picfresh/services/auth_service.dart';
import 'package:picfresh/theme.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              //color: Colors.blue,
              child: Column(children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 55),
                        elevation: 10,
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: null,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 35,
                          color: Colors.black,
                        ),
                        Text("data"),
                      ],
                    ))
              ]),
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'LOG OUT',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                AuthServices().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(350),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
            SizedBox(height: 50),
            _profile(),
            SizedBox(height: 20),
            _logoutButton()
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ));
  }

  Widget _topBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35, bottom: 10, left: 140),
          child: Image.asset(
            ylogo,
            height: 25,
          ),
        )
      ],
    );
  }

  Widget _profile() {
    return Container(
      child: Column(
        children: [
          Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
          SizedBox(
            height: 20,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.displayName!,
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _logoutButton() {
    return MaterialButton(
      padding: const EdgeInsets.all(10),
      color: Colors.black,
      //minWidth: 80,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: const Text(
        'LOG OUT',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {
        AuthServices().signOut();
      },
    );
  }
}
