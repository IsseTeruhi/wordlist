import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wordlistandtest_app/screens/configue_Q.dart';
import 'package:wordlistandtest_app/screens/configue_list.dart';
import 'package:wordlistandtest_app/screens/detail_Q.dart';
import 'package:wordlistandtest_app/screens/listedit.dart';
import 'package:wordlistandtest_app/screens/question.dart';

import 'screens/add_list.dart';
import 'screens/home/home_screen.dart';
import 'screens/result.dart';

void main() {
  runApp(ProviderScope (child:  MyApp()));
}
final _router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        child: HomeScreen(
        ),
      ),
    ),
    GoRoute(
      path: '/Q/:listid/configue',
      pageBuilder: (context, state) => MaterialPage(
        child: ConfigueQ(),
      ),
    ),
    GoRoute(
      path: '/Q/:listid/answering/:qid',
      pageBuilder: (context, state) => MaterialPage(
        child: Questionscreen(),
      ),
    ),
    GoRoute(
      path: '/Q/:listid/result',
      pageBuilder: (context, state) => MaterialPage(
        child: Resultscreen(),
      ),
    ),
    GoRoute(
      path: '/Q/:listid/result/detail/:qid',
      pageBuilder: (context, state) => MaterialPage(
        child: DetailQ(),
      ),
    ),
    GoRoute(
      path: '/listedit/:listid',
      pageBuilder: (context, state) => MaterialPage(
        child: Listedit(),
      ),
    ),
    GoRoute(
      path: '/newlist/configue',
      pageBuilder: (context, state) => MaterialPage(
        child: Configuelist(),
      ),
    ),
    GoRoute(
      path: '/newlist/add/:listid',
      pageBuilder: (context, state) => MaterialPage(
        child: Addlist(),
      ),
    ),
  ],
  errorPageBuilder: (_, state) => MaterialPage(
    key: state.pageKey,
    child: ErrorPage(),
  ),
);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return
     MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}



class BasicPage extends StatelessWidget {
  const BasicPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('Error occured.'),
      ),
    );
  }
}
