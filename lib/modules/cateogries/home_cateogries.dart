import 'package:flutter/material.dart';

import 'cateogries.dart';

class HomeCateogries extends StatelessWidget {
  const HomeCateogries({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(244, 244, 244, 244),
      //appBar: AppBar(),
      body: CateogriesScreen(),
    );
  }
}
