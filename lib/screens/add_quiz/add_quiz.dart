import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/models/notes/notes_model.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';
import 'package:wordlistandtest_app/screens/add_list.dart';
import 'package:wordlistandtest_app/screens/add_quiz/add_quiz_notifier.dart';
import 'package:go_router/go_router.dart';
// final indexProvider = StateProvider<int>(((ref) => 0)); //
// final questionProvider = StateProvider<Questions>((ref) => Questions(
//     id: '',
//     state: '',
//     image: '',
//     option: [],
//     answer: '',
//     explain: '',
//     noteid: ''));

class AddQuiz extends ConsumerStatefulWidget {
  int pindex;
  String noteId;
  AddQuiz({Key? key, required this.pindex, required this.noteId})
      : super(key: key);
  @override
  AddQuizState createState() => AddQuizState();
}

class AddQuizState extends ConsumerState<AddQuiz> {
  final uuid = const Uuid();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addQuizProvider.notifier).localroad(widget.noteId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //noteをidを元に取得
    final state = ref.watch(addQuizProvider);
    final notifier = ref.read(addQuizProvider.notifier);

    final questions = state.quizList;

    TextEditingController _statecontrollers = TextEditingController();
    TextEditingController _answercontrollers = TextEditingController();
    List<TextEditingController> _optioncontrollers = [];

    return Scaffold(
      appBar: AppBar(
        title: Text('問題追加'),
        leading: IconButton
        (icon: Icon(Icons.arrow_back_ios),
         onPressed: () => context.go('/home'),  ),
      ),
      body:questions.isEmpty?Container(): Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(color: Colors.amber,)),
          Expanded(
            flex: 7,
            child: Container(
              // 余白を付ける
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.pindex != 0)
                        IconButton(
                          icon: Icon(Icons.navigate_before),
                          onPressed: () {
                            
                            context.go('/add/${widget.noteId}/${widget.pindex-1}');
                            //処理
                          },
                        ),
                      Container(
                        height: 70,
                        child: Center(
                          child: Text(
                            'Q${widget.pindex + 1}',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      if (state.quizList.length != widget.pindex + 1)
                        IconButton(
                          icon: Icon(Icons.navigate_next),
                          onPressed: () {
                            context.go('/add/${widget.noteId}/${widget.pindex+1}');
                            //処理
                          },
                        ),
                    ],
                  ),
                  _textfield(questions[widget.pindex], notifier, TextEditingController()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                      child: Column(
                        children: [
                          _answerfield(questions[widget.pindex], notifier, TextEditingController()),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: questions[widget.pindex].option.length + 1,
                                itemBuilder: ((context, index) {
                                  _optioncontrollers.add(TextEditingController());
                                  return _optionfield(
                                      questions[widget.pindex],
                                      notifier,
                                      TextEditingController(),
                                      index); //textproviderを使う？
                                })),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(state.quizList.length==widget.pindex+1)
                  FloatingActionButton.extended(
                      tooltip: '',
                      icon: Icon(Icons.add), //アイコンは無しでもOK
                      label: Text('次の問題を追加'),
                      onPressed: () {
                        if (questions[widget.pindex].text.isNotEmpty &&
                            questions[widget.pindex].answer.isNotEmpty &&
                            questions[widget.pindex].option.length > 0) {
                          notifier.addNewQuestion(widget.noteId, widget.pindex + 1);
                          context.go('/add/${widget.noteId}/${widget.pindex+1}');
                        } else {
                          _bar("入力に不備があります。", context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bar(String x, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(x),
      duration: const Duration(milliseconds: 5000),
    ));
  }

  Widget _textfield(Questions question, AddQuizNotifier notifier,
      TextEditingController controller) {
    String ostate = question.text;
    controller = TextEditingController(text: ostate == "" ? "" : ostate);
    submit() {
      ostate = controller.text;
      final state = question.copyWith(text: ostate);
      notifier.updateQuestion(state);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Focus(
          onFocusChange: (hasFocus) {
            if (!hasFocus) {
              submit();
            }
          },
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(30),
              fillColor: Colors.red,
              filled: true,
              border: OutlineInputBorder(),
              hintText: '問題文を入力してください',
            ),
            onFieldSubmitted: (String data) {
              submit();
            },
          )),
    );
  }

  Widget _answerfield(Questions question, AddQuizNotifier notifier,
      TextEditingController controller) {
    //関数を書くときは返す値の確認と定義(今回はtextformfieldを返すのでwidget)
    String oanswer = question.answer;
    controller = TextEditingController(text: oanswer == "" ? "" : oanswer);
    submit() {
      oanswer = controller.text;
      final state = question.copyWith(answer: oanswer);
      notifier.updateQuestion(state);
    }

    ;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            submit();
          }
        },
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            fillColor: Colors.green,
            filled: true,
            border: OutlineInputBorder(),
            hintText: '解答を入力してください',
          ),
          onFieldSubmitted: (String data) {
            submit();
          },
        ),
      ),
    );
  }

  Widget _optionfield(Questions question, AddQuizNotifier notifier,
      TextEditingController controller, int _index) {
    List<String> optionList = question.option;
    print(optionList);
    optionList = List.of(optionList);
    controller = TextEditingController(
        text: optionList.length == _index ? '' : optionList[_index]);
    submit() {
      if (optionList.length == _index) {
        if (controller.text.isNotEmpty) {
          optionList.add(controller.text);
        }
      } else {
        if (controller.text.isEmpty) {
          optionList.removeAt(_index);
        } else {
          optionList[_index] = controller.text;
        }
      }
      print(optionList.length == _index + 1);

      final state = question.copyWith(option: optionList);
      print(state);

      notifier.updateQuestion(state);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            submit();
          }
        },
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.red,
            filled: true,
            border: OutlineInputBorder(),
            hintText: '選択肢$_index(不正解の選択肢)を入力してください',
          ),
          onFieldSubmitted: (String data) {
            submit();
          },
        ),
      ),
    );
  }
}
