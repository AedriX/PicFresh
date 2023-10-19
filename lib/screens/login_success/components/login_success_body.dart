import 'package:flutter/material.dart';
//import 'package:picfresh/components/default_button.dart';
import 'package:picfresh/screens/home/home_screen.dart';
import 'package:picfresh/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
          width: SizeConfig.screenWidth,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
            height: 50,
            //width: MediaQuery.of(context).size.width,
            width: SizeConfig.screenWidth * 0.8,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Color(0xD6ffd732),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  Navigator.pushNamed(
                      context, HomeScreen.routeName);
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,),
                )),
        ),
        Spacer(),
      ],
    );
  }
}
