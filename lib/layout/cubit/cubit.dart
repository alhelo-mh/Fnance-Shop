import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/layout/cubit/statas.dart';
import 'package:shop_application/models/add_favorites_model.dart';
import 'package:shop_application/models/shop_app/categories_model.dart';
import 'package:shop_application/models/shop_app/home_model.dart';
import 'package:shop_application/models/shop_app/login_model.dart';

import 'package:shop_application/modules/favorites/home_favrites.dart';

import 'package:shop_application/modules/cart_screen.dart';
import 'package:shop_application/modules/products/home_product.dart';

import 'package:shop_application/modules/profile_setting.dart';
import 'package:shop_application/modules/setting/profile_screen.dart';

import 'package:shop_application/shared/components/constants.dart';
import 'package:shop_application/shared/network/eng_points.dart';
import 'package:shop_application/shared/network/remot/dio_helper.dart';

import '../../models/add_cart.dart';
import '../../models/shop_app/Favrites_model.dart';
import '../../models/shop_app/cart_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreen = [
    HomeProduct(),
    HomeFavrites(),
    const CartScreen(),
    ProfileScreen()
  ];
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  late Map<int, bool> cart;

  void getHomeData() {
    emit(ShopLodingHomeState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel!.data.banners[1].image.toString());

      log(homeModel!.data.banners[0].id.toString());
      homeModel!.data.products.forEach(
        (element) {
          favorites.addAll({
            element.id: element.in_favorites,
          });
        },
      );
      log(favorites.toString());
      emit(ShopSuccessHomeState());
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModle? categoriesModle;
  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModle = CategoriesModle.fromJson(value.data);
      log(categoriesModle!.data.data[0].id.toString());
      emit(ShopSuccesscategoriesState());
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorcategoriesState());
    });
  }

  AddFavoritesModel? addFavoritsModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVRITES,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      addFavoritsModel = AddFavoritesModel.fromJson(value.data);
      log('message ${value.data} ');

      if (!addFavoritsModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      log('message2');

      emit(ShopSuccessChangeFavoritesState(addFavoritsModel!));
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavritesModel? favoritsModel;

  void getFavorites() {
    log('message3');
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVRITES,
      token: token,
    ).then((value) {
      favoritsModel = FavritesModel.fromJson(value.data);
      log(value.data);
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }
//----------------------------------------------------

  late AddCart addCart;

  void changeCart(int productId) {
    // print(productId);
    // cart[productId] = !cart[productId]!;
    emit(ShopChangeCartsState());
    print(productId);
    DioHelper.postData(
      url: CART,
      data: {'product_id': productId},
      token: token,
    ).then((value) {
      addCart = AddCart.fromJson(value.data);
      log('message ${value.data} ');

      if (!addCart.status!) {
        cart[productId] = !cart[productId]!;
      } else {
        getCart();
      }
      log('message2');

      emit(ShopSuccessChangeCartState(addCart));
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorChangeCartsState());
    });
  }

  Cart? carts;

  void getCart() {
    log('message3');
    emit(ShopLoadingGetCartsState());
    DioHelper.getData(
      url: CART,
      token: token,
    ).then((value) {
      carts = Cart.fromJson(value.data);
      // log(value.data);
      emit(ShopSuccessGetCartsState());
      log(carts!.data!.cartItems!.length.toString());
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorGetCartsState());
    });
  }

  loginModel? usreModel;

  void getUserData() {
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      usreModel = loginModel.formJson(value.data);
      log(usreModel!.data!.name!);
      emit(ShopSuccessGetUserDataState(usreModel!));
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorGetUserDataState());
    });
  }

  void getUpdateUser({
    required String name,
    required String email,
    required String phone,
  
  }) {
    emit(ShopLoadingGetUpdateUserState());
    DioHelper.putData(url: UPDATE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
     
    }).then((value) {
      usreModel = loginModel.formJson(value.data);
      log(usreModel!.data!.name!);
      emit(ShopSuccessGetUpdateUserState(usreModel!));
    }).catchError((error) {
      log(error.toString());
      emit(ShopErrorGetUpdateUserState());
    });
  }
}
