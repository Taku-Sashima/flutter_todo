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
      title: 'Todo App',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

// リスト一覧画面用Widget
class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffa0ffa0),
        title: const Text('リスト一覧'),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(top: 40),
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return 
          Card(
            margin: const EdgeInsets.only(left: 20, right: 20,top: 6, bottom: 6),
            child: Container(
              margin: const EdgeInsets.all(8),
              // height: 30,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // ダイアログを表示
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('タスク'),
                        content: Text(todoList[index]),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // ダイアログを閉じる
                            },
                            child: const Text('閉じる'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  todoList[index],
                  style: const TextStyle(fontSize: 26),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffa0ffa0),
        onPressed: () async {
          // "push"で新規画面に遷移
          final newListText = await Navigator.of(context).push(
            // 遷移先の画面としてリスト追加画面を指定
            MaterialPageRoute(builder: (context) => const TodoAddPage()),
          );
          if (newListText == null) {
            // キャンセルした場合は newListText が null となるので注意
            print("null");
          }else{
            setState((){
              todoList.add(newListText);
            });
            print("not null");
          }
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

