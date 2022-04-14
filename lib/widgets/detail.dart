import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String title;
  final String note;
  Detail(this.title, this.note);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NoteBook"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            note,
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
