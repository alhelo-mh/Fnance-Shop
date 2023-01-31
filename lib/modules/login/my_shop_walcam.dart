


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/modules/login/login.dart';



class MuShopStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  'https://img.freepik.com/free-photo/employees-grocery-stores-coffee-shop-concept-handsome-friendly-guy-worker-cafe-store-clerk-wearing-black-apron-showing-thumbs-up-smiling-welcome-guest-guarantee-quality_1258-59032.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(130, 43, 3, 75),
              ),
              Positioned(
                top: 500,
                right: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(130, 231, 185, 68),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(130))),
                  width: 269,
                  height: 146,
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 52, 40, 62),
                          Color.fromARGB(255, 132, 95, 161),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 375.w,
                  height: 291.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY',
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 31.sp),
                            ),
                            Text(
                              'Shop',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 31.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          'Lorem Ipsum is simply dummy text of the printing\n                     and typesetting industry',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 50),
                          width: 239.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                              color: Colors.amber[600],
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
