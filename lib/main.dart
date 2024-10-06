import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const TodoListPage(),
    );
  }
}

// リスト一覧画面用Widget
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧'),
      ),
      body:  ListView(
        children: <Widget>[
          Card(
            child: Container(
              height: 60,
              width: double.infinity,
              child: const Text('あああああ'),
            ),
          ),
          Card(
            child: Container(
              height: 60,
              width: double.infinity,
              child: const Text('あああああ'),
            ),
          ),
          Card(
            child: Container(
              height: 60,
              width: double.infinity,
              child: const Text('あああああ', style: TextStyle(fontSize: 30)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const TodoAddPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});
  
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

// ToDo追加画面
class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffa0ffa0),
        title: const Text('リスト追加'),
      ),

      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_text, style: TextStyle(color: Colors.blue)),

            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: TextField(
                onChanged: (String value) {
                  // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                    // データを変更
                    _text = value;
                  });
                },
                style: const TextStyle(
                  fontSize: 26
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffa0ffa0),
                  foregroundColor: const Color(0xffffffff),
                ),
                // 追加する処理
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: const Text(
                  'ToDo追加',
                  style: TextStyle(
                    fontSize: 26
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: TextButton(
                // 追加する処理
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'キャンセル',
                  style: TextStyle(
                    fontSize: 26
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

