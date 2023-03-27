import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgetScreen extends ConsumerStatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  ForgetScreenState createState() => ForgetScreenState();
}

class ForgetScreenState extends ConsumerState<ForgetScreen> {
  TextEditingController _textFieldController = TextEditingController();
  String email = '';
  String password = '';
  //定義づけは最初に
  // _snackbar(String _message) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(_message),
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
              child: Column(
                  //縦に並べる
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "forgetScreen my password",
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
                        },
//テキストコントローラ
                        controller: _textFieldController,
                        decoration: InputDecoration(
                            //ヒントの表示
                            hintText: "メールアドレスを入力してください"),
                      ),
                    ),
                    email.contains('@')
                        ? ElevatedButton(
                            child: const Text('メールを送信'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            // onPressed: ()async {
                            //   try {
                            //   await  FirebaseAuth.instance
                            //         .sendPasswordResetEmail(email: email);

                            //     _snackbar('メールが送信されました');
                            //   } catch (e) {
                            //     _snackbar('そのメールアドレスは登録されていません');
                            //   }
                            // },
                          )
                        : Container(
                            height: 60,
                          ),
                  ]),
            )); //UIに表示させるボタンや背景の色、素材の表示
  }
}
