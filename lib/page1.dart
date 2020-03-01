import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  //middle 부분 광희 더미짤
  'https://2.bp.blogspot.com/-6SKhtpLJvFg/VkdRfugghEI/AAAAAAAAMWc/rwetBIaqQnE/s800/2.jpg',
  'https://pbs.twimg.com/media/DuR8gvkU0AIUkoO.jpg',
  'https://mblogthumb-phinf.pstatic.net/20150822_148/cosl922_1440240875188zcNG9_JPEG/%BF%E5%281%29.jpg?type=w2',
];

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //요소들이 스크롤 가능하게끔
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
}

Widget _buildTop() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              //제스처감지
              onTap: () {
                print('클릭');
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/taxi.png',
                    width: 60.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('택시'),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/scooter.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('바이크'),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/bicycle.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('자전거'),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/car.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('대리'),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/parking.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('주차'),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/carpool.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('카풀'),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/navi.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('내비'),
              ],
            ),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/shuttle.png',
                  width: 60.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('셔틀'),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMiddle() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: CarouselSlider(
      height: 200.0, //높이
      autoPlay: true, //자동 슬라이더 효과
      items: dummyItems.map((url) {
        return Builder(
          builder: (BuildContext context) {
            //context를 사용하고자 할 때
            return Container(
              width: MediaQuery.of(context).size.width, //기기 가로길이
              margin: EdgeInsets.symmetric(horizontal: 5.0), //좌우 여백
              child: ClipRect(
                child: Image.network(
                  url,
                  fit: BoxFit.cover, //화면 여백 없이
                ),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}

Widget _buildBottom() {
  final items = List.generate(7, (i) {
    //0~7까지 수를 생성해 두번째 인수의 함수에 i 매개변수로 전달함
    //i 값을 전달받아 ListTile 위젯 형태로 반환하여 그것들의 리스트가 반환됨
    return ListTile(
      leading: Icon(
        Icons.notifications_none,
        color: Colors.redAccent,
      ),
      title: Text('[바이크 위생 강화] 보다 안전하게 이용하세요!'),
    );
  });
  return ListView(
    physics: NeverScrollableScrollPhysics(), //이 리스트의 스크롤 동작 금지
    shrinkWrap: true, //해당 리스트가 다른 스크롤 객체 안에 있다면 true로 설정해야 함
    children: items,
  );
}
