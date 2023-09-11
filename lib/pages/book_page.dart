import 'package:flutter/material.dart';
import 'package:flutter_provider/common/color.dart';
import 'package:flutter_provider/pages/book_favor_page.dart';
import 'package:flutter_provider/pages/book_list_page.dart';
// import 'package:flutter_provider/provider/theme_provider.dart';
// import 'package:provider/provider.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  var _selectedIndex = 0;
  final _pages = [const BookListPage(), const BookFavorPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        // 根据是否暗黑自定义颜色
        // selectedItemColor: context.read<ThemeProvider>().isDark() ? primaryColor : Colors.red,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "书籍列表"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "收藏")
        ],
      ),
    );
  }
}
