import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backgrount = const Color.fromARGB(255, 37, 37, 37),
  bool isUpperCase = true,
  double radius = 0.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 64,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgrount,
      ),
    );
Widget defaultTextButton({
  required Function()? function,
  required String text,
}) =>
    TextButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
            color: Color.fromARGB(255, 34, 34, 34),
          ),
        ));

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType type = TextInputType.visiblePassword,
  Function(dynamic text)? onSubmit,
  // Function? onChange,
  Function()? onTap,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool ispassword = false,
  Function()? suffixPressed,
  Function(dynamic text)? onChange,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: ispassword,
    onChanged: onChange,
    onTap: onTap,
    onFieldSubmitted: onSubmit,
    validator: (value) {
      return validate(value);
    },
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color.fromARGB(255, 211, 210, 210)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color.fromARGB(255, 83, 83, 83)),
      ),
      labelText: label,
      labelStyle: const TextStyle(fontSize: 20, color: Colors.grey),
      prefixIcon: Icon(
        prefix,
        color: Colors.grey,
      ),
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffix),
            )
          : null,
      border: OutlineInputBorder(
          gapPadding: 0.2,
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade200, style: BorderStyle.solid, width: 1)),
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[200],
      ),
    );
void navigateTO(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
void showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;

    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model.image!,
                  ),
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                if (model.discount! != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price!.toString(),
                        style:
                            const TextStyle(fontSize: 14, color: defaultColoer),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.discount! != 0)
                        Text(
                          model.oldPrice!.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changeFavorites(model.id!);
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                ShopCubit.get(context).favorites[model.id!]!
                                    ? defaultColoer
                                    : Colors.green[200],
                            child: const Icon(
                              Icons.favorite_outline,
                              size: 15,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget buildGridProduct(model, context) => ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 176.h,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Container(
                    height: 163.h,
                    width: 163.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(model.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Required some widget in between to float AppBar
                  Container(),
                  Positioned(
                      top: 144.h,
                      left: 120.w,
                      child: IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changeFavorites(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(
                              ShopCubit.get(context).favorites[model.id]!
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              size: 25,
                              color: ShopCubit.get(context).favorites[model.id]!
                                  ? const Color.fromRGBO(231, 185, 68, 100)
                                  : const Color.fromARGB(255, 132, 95, 161),
                            ),
                          ))),
                  if (model.discount != 0)
                    Container(
                      width: 47.w,
                      height: 20.h,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        ' -50%',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      log(rating.toString());
                    },
                  ),
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.3),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${model.price.round()}',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      // Text(
                      //   '\$${model.old_price.round()}',
                      //   style: TextStyle(
                      //       fontSize: 15,
                      //       color: Color.fromRGBO(52, 40, 62, 100),
                      //       decoration: TextDecoration.lineThrough),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
