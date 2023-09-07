import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_provider/pages/dark_mode_page.dart';
import 'package:flutter_provider/pages/detail_page.dart';
import 'package:flutter_provider/pages/home_page.dart';
import 'package:flutter_provider/pages/list_page.dart';
import 'package:flutter_provider/pages/model_view_page.dart';
import 'package:flutter_provider/pages/my_page.dart';
import 'package:flutter_provider/pages/recommend_page.dart';

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
          name: 'recommend',
          path: 'recommend',
          builder: (BuildContext context, GoRouterState state) {
            return const RecommendPage();
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
  ],
);
