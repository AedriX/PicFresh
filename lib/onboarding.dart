import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:picfresh/auth_service.dart';
import 'package:picfresh/screens/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: Intro_data.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                      image: Intro_data[index].image,
                      text: Intro_data[index].text,
                    )),
          ),
          SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                  onPressed: () async {
                    if (currentIndex == Intro_data.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AuthServices().handleAuthState()));
                    }
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  child: Icon(Icons.arrow_right_outlined))),
          SizedBox(
            height: 60,
          )
        ],
      )),
    );
  }
}

class Onboard {
  final String image, text;

  Onboard({required this.image, required this.text});
}

final List<Onboard> Intro_data = [
  Onboard(
    image: "assets/images/splash_pic/chef_1.png",
    text: "Welcome to Yum Me! \nLet’s Cook!",
  ),
  Onboard(
    image: "assets/images/splash_pic/chef_2.png",
    text: "We'll show you the easy way to cook. \nJust stay at home with us!",
  ),
  Onboard(
    image: "assets/images/splash_pic/dish_1.png",
    text:
        "Don't worry about the result, \nIt's all beginner firendly and tasty!",
  ),
];

class OnboardingContent extends StatelessWidget {
  OnboardingContent({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "PicFresh",
          style: TextStyle(
            fontSize: 36,
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}
