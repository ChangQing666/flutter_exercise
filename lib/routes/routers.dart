import 'package:flutter/material.dart';
import 'package:flutter_provider/pages/book_page.dart';
import 'package:flutter_provider/pages/count_rebuild_page.dart';
import 'package:flutter_provider/pages/future_provider_page.dart';
import 'package:flutter_provider/pages/selector_page.dart';
import 'package:flutter_provider/pages/selector_rebuild_page.dart';
import 'package:flutter_provider/pages/stream_provider_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_provider/pages/dark_mode_page.dart';
import 'package:flutter_provider/pages/detail_page.dart';
import 'package:flutter_provider/pages/home_page.dart';
import 'package:flutter_provider/pages/list_page.dart';
import 'package:flutter_provider/pages/model_view_page.dart';
import 'package:flutter_provider/pages/my_page.dart';

import '../pages/city_page.dart';

// 将appRouter用一个方法返回，这样可以在main.dart中使用MultiProvider包裹

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'app',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'book',
          path: 'book',
          builder: (BuildContext context, GoRouterState state) {
            return const BookPage();
          },
        ),
        GoRoute(
          name: 'my',
          path: 'my',
          builder: (BuildContext context, GoRouterState state) {
            return const MyPage();
          },
        ),
      ],
    ),
    GoRoute(
      name: 'count_rebuild',
      path: '/count_rebuild',
      builder: (BuildContext context, GoRouterState state) {
        return const CountRebuildPage();
      },
    ),
    GoRoute(
      name: 'selector_rebuild',
      path: '/selector_rebuild',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectorRebuildPage();
      },
    ),
    GoRoute(
      name: 'selector',
      path: '/selector',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectorPage();
      },
    ),
    GoRoute(
      name: 'list',
      path: '/list',
      builder: (BuildContext context, GoRouterState state) {
        return ListPage(id: state.uri.queryParameters['id'] as String);
      },
    ),
    GoRoute(
      name: 'detail', // optional, but recommended for debugging
      path: '/detail/:id',
      builder: (BuildContext context, GoRouterState state) {
        return DetailPage(
          id: state.pathParameters['id'] as String,
        );
      },
    ),
    GoRoute(
        name: 'dark_mode',
        path: '/dark_mode',
        builder: (BuildContext context, GoRouterState state) {
          return const DarkModePage();
        }),
    GoRoute(
        name: 'model_view',
        path: '/model_view',
        builder: (BuildContext context, GoRouterState state) {
          return const ModelViewPage();
        }),
    GoRoute(
        name: 'city',
        path: '/city',
        builder: (BuildContext context, GoRouterState state) {
          return const CityPage();
        }),
    GoRoute(
        name: 'future_provider',
        path: '/future_provider',
        builder: (BuildContext context, GoRouterState state) {
          return const FutureProviderPage();
        }),
    GoRoute(
        name: 'stream_provider',
        path: '/stream_provider',
        builder: (BuildContext context, GoRouterState state) {
          return const StreamProviderPage();
        }),
    GoRoute(
        name: 'book_page',
        path: '/book_page',
        builder: (BuildContext context, GoRouterState state) {
          return const BookPage();
        }),
  ],
);
