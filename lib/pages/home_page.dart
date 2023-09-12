import 'package:flutter/material.dart';
import 'package:flutter_provider/common/color.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Provider'),
          actions: [
            IconButton(
              icon: Icon(context.watch<ThemeProvider>().isDark()
                  ? Icons.nightlight_round
                  : Icons.wb_sunny_rounded),
              onPressed: () {
                context.pushNamed('dark_mode');
              },
            ),
          ],
        ),
        drawer: _drawer(context),
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

  Drawer _drawer(BuildContext context) {
    return Drawer(
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
    );
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
              style: TextStyle(fontSize: 30, color: primaryColor)),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(primaryColor),
            ),
            onPressed: () {
              context.pushNamed('dark_mode');
            },
            child: const Text('Go to Dark_Mode page',
                style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('book_page');
            },
            child: const Text('Go to book_page page',
                style: TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('count_rebuild');
            },
            child: const Text('Go to count_rebuild page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('selector_rebuild');
            },
            child: const Text('Go to selector_rebuild page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('selector');
            },
            child: const Text('Go to selector page'),
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
          ElevatedButton(
            onPressed: () {
              context.pushNamed('city');
            },
            child: const Text('Go to City page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('future_provider');
            },
            child: const Text('Go to Future page'),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed('stream_provider');
            },
            child: const Text('Go to stream page'),
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
        selectedItemColor: primaryColor,
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
