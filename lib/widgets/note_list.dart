import 'package:flutter/material.dart';
import '../models/note.dart';
import './detail.dart';

class NoteList extends StatelessWidget {
  final List<Note> notelist;
  final Function _deleteTransaction;

  NoteList(this.notelist, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print(notelist);
    return notelist.isEmpty
        ? Text("No note")
        : Container(
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          print(index);
                          return Card(
                            
                            elevation: 5,
                            child: ListTile(
                              leading: GestureDetector(
                                child: Text(notelist[index].title),
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(
                                            notelist[index].title,
                                            notelist[index].note)
                                        //Detail()
                                        ),
                                  )
                                },
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      _deleteTransaction(notelist[index].id),
                                  icon: Icon(Icons.delete)),
                            ),
                          );
                        },
                        itemCount: notelist.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
