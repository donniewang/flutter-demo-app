import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';
import 'package:zdp/page/home/home.dart';
import 'package:zdp/page/order/order.dart';
import 'package:zdp/page/todo/todo.dart';
import 'package:zdp/page/mine/mine.dart';
import 'package:zdp/utils/navigator_util.dart';
import 'package:zdp/utils/shared_preferences_util.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    _list..add(HomeView())..add(OrderView())..add(TodoView())..add(MineView());
  }

  void _onItemTapped(int index) {
    if (index > 0) {
      SharedPreferencesUtils.getToken().then((value) {
        if (value == null) {
          NavigatorUtils.goLoginPage(context);
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/home.png',
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              'images/home_act.png',
              width: 20,
              height: 20,
            ),
            title: Text(Strings.HOME)
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/bid.png',
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              'images/bid_act.png',
              width: 20,
              height: 20,
            ),
            title: Text(Strings.ORDER)),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/daiban.png',
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              'images/daiban_act.png',
              width: 20,
              height: 20,
            ),
            title: Text(Strings.TODO)),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/my.png',
              width: 20,
              height: 20,
            ),
            activeIcon: Image.asset(
              'images/my_act.png',
              width: 20,
              height: 20,
            ),
            title: Text(Strings.MINE)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
