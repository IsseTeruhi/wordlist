import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/models/notes/notes_model.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';
import 'package:wordlistandtest_app/models/reports/reports_model.dart';
import 'package:wordlistandtest_app/screens/add_list.dart';
import 'package:wordlistandtest_app/screens/add_quiz/add_quiz_notifier.dart';
import 'package:go_router/go_router.dart';
import 'package:wordlistandtest_app/screens/quiz_screen/quiz_screen_notifier.dart';

class DetailQuizScreen extends ConsumerStatefulWidget {
  int pindex;
  String noteId;
  DetailQuizScreen({Key? key, required this.pindex, required this.noteId})
      : super(key: key);
  @override
  DetailQuizScreenState createState() => DetailQuizScreenState();
}

class DetailQuizScreenState extends ConsumerState<DetailQuizScreen>
    with TickerProviderStateMixin {
  List<String> optionList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizProvider.notifier).localroad(widget.noteId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //noteをidを元に取得
    final questions = ref.watch(quizProvider).quizList;
    final question = questions[widget.pindex];
    String oanswer = question.answer;
    optionList = question.option;
    optionList = List.of(optionList);
    optionList.add(oanswer);
    optionList.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('問題解答'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/Result/${widget.noteId}'),
        ),
      ),
      body: questions.isEmpty
          ? Container()
          : Container(
              // 余白を付ける
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                'Q${widget.pindex + 1}:',
                                style: const TextStyle(fontSize: 30),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Text(
                                    questions[widget.pindex].text,
                                    style: const TextStyle(fontSize: 45),
                                    textAlign: TextAlign.start,
                                  )))
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            flex: 9,
                            child: ListView.builder(
                                itemCount: question.option.length + 1,
                                itemBuilder: ((context, index) {
                                  if (index == 0) {
                                    return Text(
                                      question.answer,
                                      style: const TextStyle(fontSize: 45),
                                      textAlign: TextAlign.start,
                                    );
                                  } else {
                                    return Text(
                                      question.option[index - 1],
                                      style: const TextStyle(fontSize: 45),
                                      textAlign: TextAlign.start,
                                    );
                                  }
                                })),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 2,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Expanded(
                              flex: 1,
                              child: Text(
                                '解説:',
                                style: TextStyle(fontSize: 30),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Text(
                                  questions[widget.pindex].explain,
                                  style: const TextStyle(fontSize: 45),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            )
                          ])),
                ],
              ),
            ),
    );
  }
}
