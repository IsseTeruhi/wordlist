import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordlistandtest_app/Screens/quiz_Screen/quiz_screen_notifier.dart';
import 'package:wordlistandtest_app/models/reports/reports_model.dart';
import 'package:wordlistandtest_app/screens/result/result_screen_notifier.dart';

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
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final state =ref.watch(resultScreenProvider);
    final reports = state.reportList;
    final quizList = state.quizList;
    
    return Container(
      child: ListView.builder(
          itemCount:quizList .length,
          itemBuilder: ((context, index) {
           Reports report = reports[index];
            return Text(report.iscorrect.toString()); //textproviderを使う？
          })),
    );
  }
}
