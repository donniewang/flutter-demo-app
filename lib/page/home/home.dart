import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zdp/service/home_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zdp/api/api.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> bannerList = List();

  List<Map> carList = List();

  HomeService homeService = HomeService();

  @override
  void initState() {
    bannerList
      ..add(Image.asset("images/banner1.jpg", fit: BoxFit.fitWidth))
      ..add(Image.asset("images/banner2.jpg", fit: BoxFit.fitWidth));
    super.initState();
    getHomeCarList();
  }

  void getHomeCarList() {
    Map<String, dynamic> map = Map();
    map.putIfAbsent("ps", () => 10);
    map.putIfAbsent("pn", () => 1);
    homeService.getHomeCarList(map, (data) {
      if (data['content'] != null && data['content'].length > 0) {
        setState(() {
          for (Map item in data['content']) {
            carList.add(item);
          }
        });
      }
    }, (message) {
      print(message);
      _showToast(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          bannerSwiperView(),
          toolView(),
          yupaiView(),
        ],
      ))),
    );
  }

  Widget bannerSwiperView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 199,
      child: Swiper(
        itemCount: 2,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (bannerList[index]);
  }

  Widget toolView() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
                child: Column(children: [
              Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: new BoxDecoration(
                    color: Color(0xFFEB322A),
                    borderRadius: new BorderRadius.circular((1000)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/cars_icon.png",
                      width: 42,
                      height: 42,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(height: 10),
              Center(
                child: Text("拍卖大厅",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ])),
            Container(
                child: Column(children: [
              Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: new BoxDecoration(
                    color: Color(0xFF4C4C4C),
                    borderRadius: new BorderRadius.circular((1000)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/hg.png",
                      width: 42,
                      height: 42,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(height: 10),
              Center(
                child: Text("会员专区",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ])),
            Container(
                child: Column(children: [
              Center(
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: new BoxDecoration(
                    color: Color(0xFFEC8432),
                    borderRadius: new BorderRadius.circular((1000)),
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/shijian.png",
                      width: 42,
                      height: 42,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(height: 10),
              Center(
                child: Text("预拍车辆",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ])),
          ]),
          Container(
            height: 15,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: new BoxDecoration(
              color: Color(0xFFF5F5F5),
            ),
          ),
        ]));
  }

  Widget yupaiView() {
    return Container(
      decoration: new BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        yupaiTitleView(),
        yupaiTableView(),
        Container(
          height: 15,
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: new BoxDecoration(
            color: Color(0xFFF5F5F5),
          ),
        ),
      ]),
    );
  }

  Widget yupaiTitleView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Container(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 110,
            height: 35,
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            decoration: new BoxDecoration(
              color: Color(0xFFEC8432),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Text("预拍车辆",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text("车辆安排上拍中，敬请期待！",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFEC8432),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ]),
      ]),
    );
  }

  Widget yupaiTableView() {
    return Container(
        decoration: new BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Swiper(
              itemCount: carList.length,
              itemBuilder: _swiperCarBuilder,
              controller: SwiperController(),
              scrollDirection: Axis.vertical,
              autoplay: true,
              onTap: (index) => print('点击了第$index'),
            ),
          )
        ]));
  }

  Widget _swiperCarBuilder(BuildContext context, int index) {
    Map car = carList[index];
    String cityName = car['cityName'];
    String modelName = car['modelName'];
    String plateLocation = car['plateLocation'];
    String km = car['km'] != null && car['km'].toString().length > 0
        ? car['km']
        : '公里数不详';
    String color = car['color'];
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(10, 10, 3, 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Center(
            child: Container(
              child: Image.network(
                Api.IMG_HOST + car['carImg'],
                width: 185,
                height: 120,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: 5,
            height: 120,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  child: Text('[$cityName] $modelName',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Container(
                  width: 150,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('$plateLocation | $km | $color',
                      textAlign: TextAlign.left,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      )),
                )
              ]),
        ]));
  }

  _showToast(message) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xFFFB7E00),
        textColor: Colors.white,
        fontSize: 16);
  }
}
