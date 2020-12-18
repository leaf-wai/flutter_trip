import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(hideLeft: true),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem('首页', Icons.home),
            _bottomNavigationBarItem('搜索', Icons.search),
            _bottomNavigationBarItem('旅拍', Icons.camera_alt),
            _bottomNavigationBarItem('我的', Icons.account_circle)
          ]),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String title, IconData iconData) {
    return BottomNavigationBarItem(
        icon: Icon(iconData, color: _defaultColor),
        activeIcon: Icon(iconData, color: _activeColor),
        label: title);
  }
}
