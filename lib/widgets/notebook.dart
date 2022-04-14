import 'package:flutter/material.dart';

class NoteBook extends StatefulWidget {
  final Function addNew;

  NoteBook(this.addNew);
  @override
  _NoteBookState createState() => _NoteBookState();
}

class _NoteBookState extends State<NoteBook> {
  final _titleField = TextEditingController();
  final _detailField = TextEditingController();

  void _submitForm() {
    final enteredTitle = _titleField.text;
    final enteredDetail = _detailField.text;
    if (enteredTitle.isEmpty || enteredDetail.isEmpty) {
      return;
    }
    widget.addNew(enteredTitle, enteredDetail);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NoteBook"),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _titleField,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(), labelText: 'Title'),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextFormField(
                  maxLines: 8,
                  controller: _detailField,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Detail'),
                ),
              ),
              FlatButton(
                onPressed: _submitForm,
                child: Text("Add Note"),
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ));
  }
}
