//GET
// https://newsapi.org
// /v2/top-headlines?
// country=de&category=business&apiKey=1dd2d03ba4284bf5bdd4d9092ebd82b0

//https://newsapi.org/v2/everything?q=tesla&apiKey=1dd2d03ba4284bf5bdd4d9092ebd82b0

import 'dart:developer';

import 'package:shop_application/modules/login/login.dart';
import 'package:shop_application/modules/login/splash_screen.dart';
import 'package:shop_application/shared/components/components.dart';
import 'package:shop_application/shared/network/local/ccch_helper.dart';

void signOut(context) {
  CacheHelper.removeDate(key: 'token').then((value) {
    navigateAndFinish(context, SplachScreen());
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern
      .allMatches(text)
      .forEach((element) => log(element.group(0).toString()));
}

String? token = '';
