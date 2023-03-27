import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  

  @override
  void initState() {
    super.initState();
  }

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

            //上部のバー
            body: Center(
      child: SingleChildScrollView(
        child: Column(
            //縦に並べる
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LoginScreen",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
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
             Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      child: TextField(
                        keyboardType:
                            TextInputType.streetAddress, //！パスワード用のキーボード
                        autofocus: false, //テキストを入力したときに処理
                        onChanged: (v) {
                          setState(() {
                        
                          });
                        },
//テキストコントローラ
                        controller: _textFieldController2,
                        decoration: InputDecoration(
                            //ヒントの表示
                            hintText: "パスワードを入力してください"),
                      ),
                    )
                 ,
           
             ElevatedButton(
                      child: const Text('loginScreen'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {}, //_bar("submitの処理完了"),//_submit,
                    ),
                 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        context.go('/Signup');
                      },
                      child: Text("アカウントを作成")),
                  TextButton(
                      onPressed: () {
                        context.go('/Forget');
                      },
                      child: Text("パスワードを忘れた")),
                ],
              ),
              //assets/googlelogo.png
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {}, //_bar("googlesignin完了"),//_googlesubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: const ClipOval(
                        child: Image(
                      width: 30,
                      image: AssetImage('assets/images/googlelogo.png'),
                      fit: BoxFit.contain,
                    )),
                  ),
                ],
              ),
            ]),
      ),
    )); //UIに表示させるボタンや背景の色、素材の表示
  }
}
