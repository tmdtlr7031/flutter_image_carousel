import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('Timer!');
    });
  }

  @override
  void dispose() {
    // 생명주기에 따라 state가 사라질 때 타이머도 끝나게 설정
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          // Image.asset('asset/img/image_1.jpeg', fit: BoxFit.cover), // 화면에 맞춰서 늘려주는 것(잘릴 수 있다)
          1,2,3,4,5
        ].map((e) => Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}
