import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:wordlistandtest_app/models/notes/notes_model.dart';
import 'package:wordlistandtest_app/models/questions/questions_model.dart';
import 'package:wordlistandtest_app/screens/configue_list.dart';
import 'home/home_screen_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

final indexProvider = StateProvider<int>(((ref) => 0)); //

final questionProvider = StateProvider<Questions>((ref) => Questions(
    id: '',
    state: "",
    image: "",
    option: [],
    answer: "",
    explain: "",
    noteid: ""));

class Addlist extends ConsumerWidget {
  Addlist({Key? key}) : super(key: key);
  final uuid = const Uuid();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final indexQ = ref.watch(indexProvider);
    
    final question = ref.watch(questionProvider);
    final homeNotifier = ref.read(homeScreenProvider.notifier);
    final note = ref.watch(currentNoteProvider);
    TextEditingController _statecontrollers = TextEditingController();
    TextEditingController _answercontrollers = TextEditingController();
    List<TextEditingController> _optioncontrollers = [];
    _bar(String x) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(x),
        duration: const Duration(milliseconds: 5000),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('問題追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (indexQ!=0)
                  IconButton(
                    icon: Icon(Icons.navigate_before),
                    onPressed: () {
                     ref.read(indexProvider.notifier).state--;
                      //処理
                    },
                  ),
                Container(
                  height: 70,
                  child: Center(
                    child: Text(
                      'Q${indexQ+1}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                if (note.qlist.length != indexQ)
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                     ref.read(indexProvider.notifier).state++;
                    //処理
                  },
                ),
              ],
            ),
            _statefield(ref, TextEditingController()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
                child: Column(
                  children: [
                    _answerfield(ref, TextEditingController()),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: question.option.length + 1,
                          itemBuilder: ((context, index) {
                            _optioncontrollers.add(TextEditingController());
                            return _optionfield(index, ref, question,
                                _optioncontrollers[index]); //textproviderを使う？
                          })),
                    ),
                  ],
                ),
              ),
            ),
            FloatingActionButton.extended(
                tooltip: '',
                icon: Icon(Icons.add), //アイコンは無しでもOK
                label: Text('次の問題を追加'),
                onPressed: () {
                  if (question.state.isNotEmpty &&
                      question.answer.isNotEmpty &&
                      question.option.length != 0) {
                    final uid = uuid.v4();
                    Notes newNote = note
                        .copyWith(id: uid, qlist: [...note.qlist, question]);
                    ref.read(indexProvider.notifier).state++;
                    ref.read(currentNoteProvider.notifier).state = newNote;
                    ref.read(questionProvider.notifier).state = Questions(
                        id: '',
                        state: "",
                        image: "",
                        option: [],
                        answer: "",
                        explain: "",
                        noteid: "");
                  } else {
                    _bar("入力に不備があります。");
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _statefield(WidgetRef ref, TextEditingController controller) {
    final question = ref.watch(questionProvider);
    controller =
        TextEditingController(text: question.state == "" ? "" : question.state);
    submit() {
      final edditedstate = question.copyWith(state: controller.text);
      ref.read(questionProvider.notifier).state = edditedstate;
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

  Widget _answerfield(WidgetRef ref, TextEditingController controller) {
    //関数を書くときは返す値の確認と定義(今回はtextformfieldを返すのでwidget)
    final question = ref.watch(questionProvider);
    controller = TextEditingController(
        text: question.answer == "" ? "" : question.answer);
    submit() {
      final edditedanswer = question.copyWith(answer: controller.text);
      ref.read(questionProvider.notifier).state = edditedanswer;
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

  Widget _optionfield(int _index, WidgetRef ref, Questions question,
      TextEditingController controller) {
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

      ref.read(questionProvider.notifier).state = state;
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
