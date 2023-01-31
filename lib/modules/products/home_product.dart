import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/modules/products/products_screen.dart';
import 'package:shop_application/shared/components/constants.dart';

class HomeProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 61.h,
        title: InkWell(
          onTap: () {
            signOut(context);
          },
          child: Image.asset(
            'assets/images/menu.png',
            width: 45.w,
          ),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/man.png'),
              )),
        ],
      ),
      body: ProductScreen(),
    );
  }
}
