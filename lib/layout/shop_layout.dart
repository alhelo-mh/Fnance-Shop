import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/layout/cubit/cubit.dart';
import 'package:shop_application/layout/cubit/statas.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
            backgroundColor: const Color.fromARGB(244, 244, 244, 244),
            body: cubit.bottomScreen[cubit.currentIndex],
            bottomNavigationBar: BottomNavyBar(
              onItemSelected: (value) {
                cubit.changeBottom(value);
              },
              selectedIndex: cubit.currentIndex,
              items: [
                BottomNavyBarItem(
                  icon: const Icon(Icons.home_filled),
                  title: const Text('Home'),
                  activeColor: Colors.black,
                ),
                BottomNavyBarItem(
                    icon: const Icon(Icons.favorite),
                    title: const Text('favorite'),
                    activeColor: Colors.black),
                BottomNavyBarItem(
                    icon: const Icon(Icons.shopping_cart_rounded),
                    title: const Text('cart'),
                    activeColor: Colors.black),
                BottomNavyBarItem(
                    icon: const Icon(Icons.manage_accounts),
                    title: const Text('Settings'),
                    activeColor: Colors.black),
              ],
            ));
      },
    );
  }
}
