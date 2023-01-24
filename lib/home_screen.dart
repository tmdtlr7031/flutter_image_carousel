import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      // controller.page 가 double? 인 이유 -> 선언만 해놓고 PageView에 controller 선언 안한 경우 : null, 페이지가 반만 넘어간 경우 0.5 등으로 표시 가능
      int currentPage = controller.page!.toInt(); // 반올림
      int nextPage = currentPage+1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      // 여기서 duration : 페이지 넘기는 속도, curve : 넘기는 애니메이션 효과? (구글링해보자)
      controller.animateToPage(nextPage, duration: Duration(milliseconds: 400), curve: Curves.linear);

    });
  }

  @override
  void dispose() {
    controller.dispose();
    // 생명주기에 따라 state가 사라질 때 타이머도 끝나게 설정
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 상태바 글자, 아이콘 색상 변경(와이파이, 배터리잔량 표시 등)

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          // Image.asset('asset/img/image_1.jpeg', fit: BoxFit.cover), // 화면에 맞춰서 늘려주는 것(잘릴 수 있다)
          1,2,3,4,5
        ].map((e) => Image.asset('asset/img/image_$e.jpeg', fit: BoxFit.cover,)).toList(),
      ),
    );
  }
}
