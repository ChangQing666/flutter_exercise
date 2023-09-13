import 'package:flutter_provider/provider/selector_provider.dart';
import 'package:flutter_provider/provider/selector_rebuild_provider.dart';
import 'package:flutter_provider/provider/stream_provider.dart';
import 'package:flutter_provider/provider/theme_provider.dart';
import 'package:flutter_provider/provider/future_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'book_manager_model.dart';

import 'package:provider/provider.dart';
import 'package:flutter_provider/provider/count_provider.dart';

List<SingleChildWidget> appProviders = [
  // 计数器provider
  ChangeNotifierProvider(create: (_) => CountProvider()),
  // 主题provider
  ChangeNotifierProvider(create: (_) => ThemeProvider()),

  
  // 书籍provider
  Provider(create: (_) => BookModel()),
  ChangeNotifierProxyProvider<BookModel, BookManagerModel>(
    create: (_) => BookManagerModel(BookModel()),
    update: (_, bookModel, bookManagerModel) => BookManagerModel(bookModel),
  ),
  // selector
  ChangeNotifierProvider(create: (_) => UserModel()),
  ChangeNotifierProvider(create: (_) => NumberProvider()),
  // futureProvider
  FutureProvider<Person>(
      create: (_) {
        return Future.delayed(const Duration(seconds: 2),
            () => Person(name: '更新了futureProvider的值'));
      },
      initialData: Person(name: '这是futureProvider初始值')),
  StreamProvider<Label>(
      create: (_) {
        return Stream.periodic(const Duration(seconds: 1), (i) {
          return Label(name: '更新了streamProvider的值$i');
        });
      },
      initialData: Label(name: 'streamProvider初始值')),
];
