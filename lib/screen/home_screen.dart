import 'package:flutter/material.dart';
// cupertino. (날짜 선택 기능을 위해)
import 'package:flutter/cupertino.dart';

// 홈 화면을 2개로 구성한다.
// 하나는 위에쪽 DDay UI. 하나는 밑에쪽 커플이미지 UI.

// StatelessWidget을 쓰지 않고 StatefulWidget을 쓰는 이유는 상태가 변해야 하기 때문에
// 이다. Dday의 숫자는 매번 변해야 한다. 대신, 최대한 StatefulWidget을 사용하지 말자.
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

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
            _DDay(
              // _DDay 클래스에서 GestureTabCallback으로 onHeartPressed변수를 선언 후 가져다 쓰기.
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _CoupleImage(),
          ],
        ),
      ),
    );
  }
  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );

    // setState(() {
    //   firstDay = firstDay.subtract(Duration(days: 1));
    // });
    // print('Heart Clicked!! ');
  }
}

// private class ( _DDay )
class _DDay extends StatelessWidget {

  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {

    // 테마 불러오기
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(height: 16.0,),                // padding을 안쓰는 이유는?
        Text(
          'U & I',
          style: textTheme.headline1,
        ),

        Padding(padding: EdgeInsets.only(top: 16.0)), // 위에 SizedBox랑 padding중에 무엇을 선택해야 할까.
        Text(
          'The day we met first !',
          style: textTheme.bodyText1,
        ),
        Text(
          // '2017.05.27',
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyText2,
        ),

        const SizedBox(height: 16.0,),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Icon(
            Icons.favorite,
          ),
        ),

        const SizedBox(height: 16.0,),
        Text(
          // 'D + 365',
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headline1,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          'asset/img/middle_image.png',
          // height: MediaQuery.of(context).size.height / 2,
        ),
      )
    );

    return Center(
      child: Image.asset(
        'asset/img/middle_image.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    );
  }
}