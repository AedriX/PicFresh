import 'package:flutter/material.dart';
// import 'package:yumme_app/components/default_button.dart';
import 'package:picfresh/screens/sign_up/components/sign_up_form.dart';

// import '../../../components/custom_surfix_icon.dart';
// import '../../../components/form_error.dart';
import '../../../components/socal_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity, 
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.03),
                Text(
                  "Register Account",
                  style: headingStyle,
                ),
                Text(
                  "Complete your details or continus \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.07), //8% of total height
                SignUpForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.07),
                Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocalCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                        ),
                        SocalCard(
                          icon: "assets/icons/facebook-2.svg",
                          press: () {},
                        ),
                        SocalCard(
                          icon: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      "By continuing your confirm that you agree \n with our term and Condition",
                      textAlign: TextAlign.center,
                    ),
              ],
            ),
          ),
        ),     
      ),
    );
  }
}
