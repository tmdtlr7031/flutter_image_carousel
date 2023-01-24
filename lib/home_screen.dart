import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
