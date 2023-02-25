import 'package:flutter/material.dart';

// 홈 화면을 2개로 구성한다.
// 하나는 위에쪽 DDay UI. 하나는 밑에쪽 커플이미지 UI.

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],  // 100: Color(0xFFF8BBD0),
      body: SafeArea(                     // SafeArea : 시스템 UI 피해서 UI 그리기. 즉, 아이폰 노치 디자인을 위해.
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
}

// private class ( _DDay )
class _DDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0,),                // padding을 안쓰는 이유는?
        Text('U & I'),

        Padding(padding: EdgeInsets.only(top: 16.0)), // 위에 SizedBox랑 padding중에 무엇을 선택해야 할까.
        Text('The day we met first !'),
        Text('2017.05.27'),

        const SizedBox(height: 16.0,),
        IconButton(
          iconSize: 60.0,
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
          ),
        ),

        const SizedBox(height: 16.0,),
        Text('D + 365'),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}