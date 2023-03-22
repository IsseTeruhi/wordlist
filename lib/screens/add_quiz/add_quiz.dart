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
  ScrollController _cntroller = ScrollController();
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
    final state = ref.watch(quizProvider);
    final notifier = ref.read(quizProvider.notifier);

    final questions = state.quizList;

    TextEditingController _statecontrollers = TextEditingController();
    TextEditingController _answercontrollers = TextEditingController();
    List<TextEditingController> _optioncontrollers = [];
    List<String> _selecter = ["削除", "キャンセル"];
    _alert(Questions question, int index) {
      //context意味？
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "警告",
              style: TextStyle(color: Colors.red),
            ),
            content: Text("本当に削除しますか？"),
            actions: <Widget>[
              // ボタン領域
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  //context.go('/');
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  if (questions.length > 1) {
                    if (questions.length == index + 1) {
                      context.go('/add/${widget.noteId}/${index - 1}');
                    }
                    notifier.removeTodo(question.id);

                    //homeNotifier.removeTodo(_uid); //削除処理の追加
                    //context.go('/');           //routerが使えない？
                    Navigator.of(context).pop();
                  } else {
                    Navigator.of(context).pop();
                    _bar("必ず１問は必要です。", context);
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('問題追加'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: questions.isEmpty
          ? Container()
          : Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: ListView.builder(
                              controller: _cntroller,
                              itemCount: questions.length,
                              //表示するlistの長さを制限,.lengthで長さ取得
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  direction:
                                      DismissDirection.endToStart, //削除機能の方向
                                  //Dismissibleはリストのスライド削除機能、ラップして使える
                                  key: UniqueKey(),
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(15.0), //長方形の4辺全てに同じ値の余白
                                    decoration: new BoxDecoration(
                                        color: index == widget.pindex
                                            ? Colors.red
                                            : Colors.transparent,
                                        border: new Border(
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.grey))),
                                    child: ListTile(
                                      onTap: () => context
                                          .go('/add/${widget.noteId}/${index}'),
                                      leading: Text(
                                        "Q${index + 1}",
                                        style: TextStyle(fontSize: 25),
                                      ),
                                      title: Text(
                                        questions[index].text,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      trailing: PopupMenuButton<String>(
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        ),
                                        onSelected: (String s) {
                                          if (s == '削除') {
                                            _alert(questions[index],
                                                widget.pindex);
                                          }
                                          if (s == 'キャンセル') {
                                            context.go('/');
                                          }
                                          ;
                                        },
                                        itemBuilder: (BuildContext context) {
                                          return _selecter.map((String s) {
                                            return PopupMenuItem(
                                              child: Text(
                                                s,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      'font_1_honokamarugo_1.1',
                                                  color: s == '削除'
                                                      ? Colors.red
                                                      : Colors.black,
                                                ),
                                              ),
                                              value: s,
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                              child: Row(children: [
                                Icon(Icons.add),
                                SizedBox(width: 5),
                                Text('次の問題を追加')
                              ]),
                              //アイコンは無しでもOK
                              onPressed: () async {
                                notifier.addNewQuestion(widget.noteId);
                                context.go(
                                    '/add/${widget.noteId}/${questions.length}');
                                await Future.delayed(
                                        Duration(milliseconds: 100))
                                    .then((value) => _cntroller.animateTo(
                                        _cntroller.position.maxScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.ease));
                              }),
                        ),
                      ],
                    )),
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
                                  context.go(
                                      '/add/${widget.noteId}/${widget.pindex - 1}');
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
                                  context.go(
                                      '/add/${widget.noteId}/${widget.pindex + 1}');
                                  //処理
                                },
                              ),
                          ],
                        ),
                        _textfield(questions[widget.pindex], notifier,
                            TextEditingController()),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                50.0, 30.0, 50.0, 50.0),
                            child: Column(
                              children: [
                                _answerfield(questions[widget.pindex], notifier,
                                    TextEditingController()),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                      itemCount: questions[widget.pindex]
                                              .option
                                              .length +
                                          1,
                                      itemBuilder: ((context, index) {
                                        _optioncontrollers
                                            .add(TextEditingController());
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
                        _explainfield(questions[widget.pindex], notifier,
                            TextEditingController()),
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
      notifier.updateQuestion(state, widget.pindex);
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
      notifier.updateQuestion(state, widget.pindex);
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

      notifier.updateQuestion(state, widget.pindex);
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

  Widget _explainfield(Questions question, AddQuizNotifier notifier,
      TextEditingController controller) {
    //関数を書くときは返す値の確認と定義(今回はtextformfieldを返すのでwidget)
    String explain = question.explain;
    controller = TextEditingController(text: explain == "" ? "" : explain);
    submit() {
      explain = controller.text;
      final state = question.copyWith(explain: explain);
      notifier.updateQuestion(state, widget.pindex);
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
            hintText: '説明を入力してください',
          ),
          onFieldSubmitted: (String data) {
            submit();
          },
        ),
      ),
    );
  }
}
