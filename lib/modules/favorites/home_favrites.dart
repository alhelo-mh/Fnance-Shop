import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';

import 'favrites.dart';

class HomeFavrites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
              child: Image.asset(
            'assets/images/sound.png',
            width: 35,
          )),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            builder: (BuildContext context, Widget? child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            'Favorite',
                            style: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '${ShopCubit.get(context).favoritsModel!.data!.data!.length} items',
                            style: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                     FavritesScreen(),
                  ]);
            },
          ),
        ));
  }
}
