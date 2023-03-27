import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordlistandtest_app/Screens/quiz_Screen/quiz_screen_notifier.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';
import 'package:wordlistandtest_app/models/reports/reports_model.dart';
import 'package:wordlistandtest_app/screens/quiz_screen/quiz_screen.dart';
import 'package:wordlistandtest_app/screens/result/result_screen_notifier.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends ConsumerStatefulWidget {
  String noteId;
  ResultScreen({Key? key, required this.noteId}) : super(key: key);

  @override
  ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  void initState() {
    ref.read(resultScreenProvider.notifier).localroad(widget.noteId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resultScreenProvider);
    List<Reports> reports = state.reportList;
    List<Questions> quizList = state.quizList;
    List<Reports> wrongreports =
        reports.where((element) => element.iscorrect == false).toList();

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: const Text('結果表示')),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              // ignore: unrelated_type_equality_checks
              child: Text(
                  '正答率:${reports.where((element) => element.iscorrect == true).length / reports.length * 100}%',
                  style: const TextStyle(fontSize: 50))),
          const Expanded(
              flex: 1, child: Text('間違った問題', style: TextStyle(fontSize: 30))),
          Expanded(
            flex: 6,
            child: ListView.builder(
              itemBuilder: (context, index) {
                final windex = quizList.indexWhere(
                    (element) => element.id == wrongreports[index].questionid);
                return Dismissible(
                  direction: DismissDirection.endToStart, //削除機能の方向
                  //Dismissibleはリストのスライド削除機能、ラップして使える
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0), //長方形の4辺全てに同じ値の余白
                    decoration:  const BoxDecoration(
                        border:  Border(
                            bottom: BorderSide(
                                width: 1.0, color: Colors.grey))),
                    child: ListTile(
                      onTap: () => context.go('/Quiz/${widget.noteId}/detail/${quizList[windex].id}'),
                      leading: Text(
                        'Q${windex + 1}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      title: Text(
                        quizList[windex].text.toString(),
                        style: const TextStyle(fontSize: 45),
                      ),
                    ),
                  ),
                );
              },
              itemCount: wrongreports.length,
            ),
          )
        ],
      ),
    );
  }
}
