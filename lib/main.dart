import 'package:flutter/material.dart';
import './widgets/note_list.dart';
import './widgets/notebook.dart';
import './widgets/detail.dart';

import './models/note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent),
      home: MyHomePage(title: 'NoteBook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Note> _notelist = [];

  void addNote(String title, String detail) {
    final newNote = Note(
        id: DateTime.now().toString(),
        title: title,
        note: detail,
        date: DateTime.now());
    setState(() {
      _notelist.add(newNote);
    });
   
  }
   void _deleteTransaction(String id) {
    setState(() {
      _notelist.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteBook(addNote)
                            //Detail()
                            ),
                      )
                    },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: NoteList(_notelist,_deleteTransaction));
  }
}
