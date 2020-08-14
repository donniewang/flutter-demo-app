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
        _list
            ..add(HomeView())
            ..add(OrderView())
            ..add(TodoView())
            ..add(MineView());                                                                                                                                     
    }
 
    void _onItemTapped(int index) {
        if(index>0) {
          SharedPreferencesUtils.getToken().then((value) {
            if(value==null) {
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
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text(Strings.HOME),
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    title: Text(Strings.ORDER),
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text(Strings.TODO),
                    ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text(Strings.MINE),
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