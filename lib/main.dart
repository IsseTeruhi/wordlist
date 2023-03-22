import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wordlistandtest_app/common/constants.dart';
import 'package:wordlistandtest_app/screens/quiz_screen/quiz_screen.dart';
import 'package:wordlistandtest_app/screens/detail_quiz.dart';
import 'package:wordlistandtest_app/screens/result/result_screen.dart';
import 'package:wordlistandtest_app/screens/set_quiz.dart';
import 'package:wordlistandtest_app/screens/add_list.dart';
import 'package:wordlistandtest_app/screens/edit_list.dart';

import 'screens/add_quiz/add_quiz.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
        path: '/add',
        pageBuilder: (context, state) => MaterialPage(
              child: Addlist(),
            ),
        routes: [
          GoRoute(
              path: ':noteid/:pindex',
              pageBuilder: (context, state) => MaterialPage(
                    child: AddQuiz(
                        noteId: state.params['noteid']!,
                        pindex: int.parse(state.params['pindex'] ?? '0')),
                  )),
        ]),
    // GoRoute(
    //   path: '/Quiz/:noteid/configue',
    //   pageBuilder: (context, state) => MaterialPage(
    //     child: Setquiz(),
    //   ),
    // ),
    GoRoute(
        path: '/Quiz/:noteid/:pindex',
        pageBuilder: (context, state) => MaterialPage(
              child: QuizScreen(
                noteId: state.params['noteid']!,
                pindex: int.parse(state.params['pindex'] ?? '0'),
              ),
            ),
        ),
    GoRoute(
      path: '/Result/:noteid',
      pageBuilder: (context, state) => MaterialPage(
        child: ResultScreen(noteId: state.params['noteid']!),
      ),
    ),
    GoRoute(
      path: '/Quiz/:noteid/result/detail/:qid',
      pageBuilder: (context, state) => MaterialPage(
        child: Detailquiz(),
      ),
    ),
    GoRoute(
      path: '/listedit/:noteid',
      pageBuilder: (context, state) => MaterialPage(
        child: Editlist(),
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
    return MaterialApp.router(
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
