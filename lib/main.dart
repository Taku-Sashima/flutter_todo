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



// ToDo追加画面
class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加'),
      ),

      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
              ),
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: const TextField(),
            ),

            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.blue,
                ),
                // 追加する処理
                onPressed: () {
                  
                },
                child: const Text(
                  'ToDo追加',
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
                    // height: 10,
                    fontSize: 30
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

