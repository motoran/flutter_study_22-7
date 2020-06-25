import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/view/home_view.dart';
import 'package:flutterapp/view/news_view.dart';
import 'package:flutterapp/view/selectMember_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            primaryIconTheme: Theme.of(context)
                .primaryIconTheme
                .copyWith(color: Colors.black54),
            primaryTextTheme: Theme.of(context)
                .primaryTextTheme
                .apply(bodyColor: Colors.black54)),
        darkTheme: ThemeData.dark(),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static List<Widget> _pageList = [
    SelectMemberView(),
    NewsPage(
      title: 'news',
    ),
    HomePage(
      title: 'home',
    ),
  ];

  int _screen = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _screen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _screen = index;
          });
        },
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _screen,
          onTap: (index) {
            setState(() {
              _screen = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.easeOut);
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: const Text('BLOG'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              title: const Text('NEWS'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              title: const Text('HOME'),
            ),
          ]),
    );
  }
}
