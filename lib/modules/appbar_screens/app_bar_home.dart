import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHome extends StatelessWidget with PreferredSizeWidget {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Stack(
          children: [
            Container(
              // Background
              decoration: const BoxDecoration(
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
              height: 110.h,
              width: MediaQuery.of(context).size.width,
              // Background
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    Text(
                      'MY',
                      style: TextStyle(color: Colors.amber, fontSize: 18.sp),
                    ),
                    Text(
                      'Shop',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            Container(), // Required some widget in between to float AppBar

            Positioned(
              // To take AppBar Size only
              top: 120.0,
              left: 20.0,
              right: 20.0,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                ),
                primary: false,
                title: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey))),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(175);
}
