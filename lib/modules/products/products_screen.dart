import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';
import 'package:shop_application/models/shop_app/categories_model.dart';
import 'package:shop_application/models/shop_app/home_model.dart';
import 'package:shop_application/modules/products/into_product.dart';
import 'package:shop_application/modules/search/search.dart';
import 'package:shop_application/shared/components/components.dart';

class ProductScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (state.model.status!) {
            showToast(text: state.model.message!, state: ToastStates.ERROR);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
          condition: ShopCubit.get(context).homeModel != null,
          builder: (context) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Our Shop App',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTO(context, SearchScreen());
                              },
                              child: Container(
                                  width: 250.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Search',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Spacer(),
                                        Icon(Icons.search)
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/menu1.png',
                              width: 35.w,
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                productBuilder(ShopCubit.get(context).homeModel!,
                    ShopCubit.get(context).categoriesModle!, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget productBuilder(
          HomeModel model, CategoriesModle categoriesModle, context) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ScreenUtilInit(
          builder: (BuildContext context, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 300.w,
                    height: 160,
                    child: CarouselSlider(
                        items: model.data.banners
                            .map(
                              (e) => Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 160.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage('${e.image}'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // child: Image(
                                    //   image: NetworkImage('${e.image}'),
                                    //   width: double.infinity,
                                    //   height: 88.r,
                                    //   fit: BoxFit.fill,
                                    // ),
                                  ),
                                  Positioned(
                                      top: 120,
                                      left: 20,
                                      child: Container(
                                        width: 70,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.black),
                                        child: const Center(
                                          child: Text(
                                            'Get New',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: 160.r,
                          initialPage: 0,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(seconds: 2),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 5.w,
                    childAspectRatio: 1 / 1.65.r,
                    children: List.generate(
                        model.data.products.length,
                        (index) => buildGridProduct(
                            model.data.products[index], context)),
                  ),
                ),
              ],
            );
          },
        ),
      );
  Widget buildGridCatogory(DataModel model) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 88.h,
            width: 88.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    model.image!,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(52, 40, 62, 100),
                      Color.fromRGBO(132, 95, 161, 100),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(10)),
            height: 88.h,
            width: 88.w,
            child: Center(
              child: Text(
                model.name!,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );

  Widget buildGridProduct(ProductModel model, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              navigateTO(context, InfoProduct(model));
            },
            child: Container(
              height: 175.h,
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
                        ' ${(model.price! / model.old_price!) * 100} ',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: 3.7,
                  minRating: 3,
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
                    print(rating);
                  },
                ),
                SizedBox(
                  height: 3.h,
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
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '\$${model.old_price.round()}',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(52, 40, 62, 100),
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
