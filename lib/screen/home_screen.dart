import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int test = 1;
  PageController controller = PageController(
    initialPage: 0,
  );

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int page = controller.page!.toInt() + 1;

      if (page > 4) {
        page = 0;
      }

      controller.animateToPage(
        page,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          Image.asset(
            'asset/img/image_1.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'asset/img/image_2.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'asset/img/image_3.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'asset/img/image_4.jpeg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'asset/img/image_5.jpeg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();

    if (timer != null) {
      timer!.cancel();
    }
  }
}
