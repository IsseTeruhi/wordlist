import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  String _email = '';
  String _password = '';
  bool _showPassword = false;

  // _bar(String x) {
  //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(x),
  //     duration: const Duration(milliseconds: 5000),
  //   ));
  // }

  @override
  Widget build(BuildContext context) //widgetを構成
  {
    return //widgetの後に必ずreturn
        Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  context.go('/Login');
                },
              ),
            ),
            //上部のバー
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    //縦に並べる
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SignupScreen",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: TextField(
                          autofocus: false, //テキストを入力したときに処理
                          onChanged: (v) {
                            setState(() {
                              _email = v;
                            });
                          },
              //テキストコントローラ
                          controller: _textFieldController,
                          decoration: const InputDecoration(
                              //ヒントの表示
                              hintText: "メールアドレスを入力してください"),
                        ),
                      ),
                      _email.contains('@')
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              child: TextFormField(
                                  obscureText: !_showPassword,
                                  autofocus: false, //テキストを入力したときに処理
                                  onChanged: (v) {
                                    setState(() {
                                      _password = v;
                                    });
                                  },
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.visiblePassword,
              //テキストコントローラ
                                  controller: _textFieldController2,
                                  decoration: InputDecoration(
                                      //ヒントの表示
                                      hintText: "パスワードを入力してください",
                                      suffixIcon: IconButton(
                                        icon: Icon(_showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          
                                        },
                                      ))),
                            )
                          : Container(
                              height: 60,
                            ),
                      _password.length >= 6
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // _submit();
                              },
                              child: const Text('SignupScreen'),
                            )
                          : Container(
                              height: 60,
                            ),
                    ]),
              ),
            )); //UIに表示させるボタンや背景の色、素材の表示
  }
}
