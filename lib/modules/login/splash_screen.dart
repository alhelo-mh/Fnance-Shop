import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/modules/login/login.dart';
import 'package:shop_application/modules/register/register_screen.dart';
import 'package:shop_application/shared/components/components.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 600,
            width: 250,
            child: Image.asset(
              'assets/images/finance.gif',
              height: 200,
            ),
          ),
          SizedBox(
            height: 70,
          ),
          InkWell(
            onTap: () {
              navigateTO(context, Login());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50.h,
              width: 370.w,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              navigateTO(context, RegisterScreen());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 50.h,
              width: 370.w,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
