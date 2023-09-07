import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/my_page.dart';
import 'package:flutter_provider/pages/recommend_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    IconData icon = themeProvider.isDark()
        ? Icons.nightlight_round
        : Icons.wb_sunny_rounded;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Provider'),
          actions: [
            IconButton(
              icon: Icon(icon),
              onPressed: () {
                context.pushNamed('dark_mode');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(children: [
            UserAccountsDrawerHeader(
                accountName: const Text('Flutter Provider'),
                accountEmail: const Text('xlchang2016@163.com'),
                currentAccountPicture: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')),
            ListTile(
              leading: const Icon(Icons.nightlight_round),
              title: const Text('夜间模式'),
              onTap: () {
                context.pushNamed('dark_mode');
              },
            ),
          ]),
        ),
        bottomNavigationBar: _bottomNavigationBar(context),
        body: PageView(
          controller: _pageController,
          children: [
            _homeContent(context),
            const RecommendPage(),
            // const ModelViewPage(),
            const MyPage(),
          ],
        ));
  }

  // _homeContent(context)
  Padding _homeContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Home page',
              style: TextStyle(fontSize: 30, color: Colors.red)),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              context.pushNamed('dark_mode');
            },
            child: const Text('Go to Dark page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('list', queryParameters: {'id': 'abcd'});
            },
            child: const Text('Go to List page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('detail', pathParameters: {'id': '123'});
            },
            child: const Text('Go to detail page'),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '主页'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.recommend,
              ),
              label: '推荐'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.vrpano,
          //     ),
          //     label: '3D'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: '我的'),
        ]);
  }
}
