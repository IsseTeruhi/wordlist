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



class QuizScreen extends ConsumerStatefulWidget {
  int pindex;
  String noteId;
  QuizScreen({Key? key, required this.pindex, required this.noteId})
      : super(key: key);
  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends ConsumerState<QuizScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  List<String> optionList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(quizProvider.notifier).localroad(widget.noteId);
    });
    _controller1 = AnimationController(
      vsync: this, // with SingleTickerProviderStateMixin を忘れずに
      duration: Duration(milliseconds: 800),
    );
    _controller2 = AnimationController(
      vsync: this, // with SingleTickerProviderStateMixin を忘れずに
      duration: Duration(milliseconds: 800),
    );
    _animation1 =
        CurvedAnimation(parent: _controller1, curve: Curves.elasticOut);
    _animation2 =
        CurvedAnimation(parent: _controller2, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //noteをidを元に取得
    final state =ref.watch(quizScreenProvider);
    final notifier = ref.read(quizScreenProvider.notifier);
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
          onPressed: () => context.go('/home'),
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
                      flex: 3,
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
                    flex: 7,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                          child: ListView.builder(
                              itemCount: optionList.length,
                              itemBuilder: ((context, index) {
                                return _optiongenerater(
                                    index, oanswer,question); //textproviderを使う？
                              })),
                        ),
                        _correct(),
                        _incorrect()
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<TickerFuture> _answerdanimation (
      String selected, String answer,String id) async {
        final notifier = ref.read(quizScreenProvider.notifier);
    if (selected == answer) {
      notifier.addReport(widget.noteId, id, selected, true);
      return _controller1.forward().then((value) => _controller1.reverse());
      //wait
    } else {
      notifier.addReport(widget.noteId, id, selected, false);
     return  _controller2.forward().then((value) => _controller2.reverse());
      //wait
    }
  }

  Future<void> _pagerouter() async {
    final questions = ref.watch(quizProvider).quizList;
    if (questions.length == widget.pindex + 1) {
      context.go('/Result/${widget.noteId}');
    } else {
      context.go('/Quiz/${widget.noteId}/${widget.pindex + 1}');
    }
  }

  Widget _optiongenerater(int opindex, String answer,Questions question) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          _answerdanimation(optionList[opindex], answer,question.id)
              .then((value) => _pagerouter());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              optionList[opindex],
            ),
          ),
        ),
      ),
    );
  }

  Widget _correct() {
    double width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: ScaleTransition(
        scale: _animation1,
        alignment: Alignment.center,
        child: Container(
          width: width * 0.5,
          height: width * 0.5,
          decoration: new BoxDecoration(
            color: Colors.transparent,
            image: new DecorationImage(
              image: new AssetImage("assets/images/maru.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _incorrect() {
    double width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: ScaleTransition(
        scale: _animation2,
        alignment: Alignment.center,
        child: Container(
          width: width * 0.5,
          height: width * 0.5,
          decoration:  BoxDecoration(
            color: Colors.transparent,
            image:  DecorationImage(
              image:  AssetImage("assets/images/batu.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
