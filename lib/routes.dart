import 'package:flutter/widgets.dart';
//import 'package:picfresh/screens/categories/dessert/categories_dessert.dart';
//import 'package:picfresh/screens/categories/drinks/categories_drinks.dart';
//import 'package:picfresh/screens/categories/meat/categories_meat.dart';
//import 'package:picfresh/screens/categories/seafood/categories_seafood.dart';
//import 'package:picfresh/screens/categories/veggies/categories_veggies.dart';
//import 'package:picfresh/screens/details/details_screen.dart';
//import 'package:picfresh/screens/forgot_password/forgot_password_screen.dart';
import 'package:picfresh/screens/home/home_screen.dart';
import 'package:picfresh/screens/login_success/login_success_screen.dart';
import 'package:picfresh/screens/sign_in/sign_in_screen.dart';
import 'package:picfresh/screens/splash/splash_screen.dart';
import 'package:picfresh/screens/sign_up/sign_up_screen.dart';
import 'package:picfresh/screens/article/article_screen.dart';
//import 'package:picfresh/screens/recipe/recipe_screen.dart';
import 'package:picfresh/screens/favorite/favorite_screen.dart';
import 'package:picfresh/screens/profile/profile_screen.dart';
import 'package:picfresh/screens/camera/camera_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  //ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ArticleScreen.routeName: (context) => ArticleScreen(),
  CameraScreen.routeName: (context) => CameraScreen(),
  //DetailsScreen.routeName: (context) => DetailsScreen(),
  //RecipeScreen.routeName: (context) => RecipeScreen(),
  //CategoriesMeat.routeName: (context) => CategoriesMeat(),
  //CategoriesSeafood.routeName: (context) => CategoriesSeafood(),
  //CategoriesVeggies.routeName: (context) => CategoriesVeggies(),
  //CategoriesDessert.routeName: (context) => CategoriesDessert(),
  //CategoriesDrinks.routeName: (context) => CategoriesDrinks(),
  FavoriteScreen.routeName: (context) => FavoriteScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};