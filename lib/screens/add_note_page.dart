import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});
  static const routs = 'addnote';
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  GlobalKey titleset = GlobalKey();
  GlobalKey noteset = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        title: Text(
          'Add Note',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 3,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.only(right: 190),
            child: Text(
              'Title',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Form(
            key: titleset,
            child: TextFieldTapRegion(
              child: Container(
                margin: EdgeInsets.only(left: 50),
                width: 300,
                height: 100,
                child: TextFormField(
                  controller: titleController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 255, 34),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 225, 255),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 255, 0, 0),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(right: 190),
            child: Text(
              'Note',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Form(
            key: noteset,
            child: TextFieldTapRegion(
              child: Container(
                margin: EdgeInsets.only(left: 50),
                width: 300,
                height: 200,
                child: TextFormField(
                  maxLength: 200,
                  controller: noteController,
                  maxLines: 7,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.white, fontSize: 15),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 218, 215, 215),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 56, 221, 111),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 0, 225, 255),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 18, 14, 248),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 60, top: 50),
            width: 250,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 6,
                shadowColor: Colors.purple,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                String title = titleController.text.trim();
                String note = noteController.text.trim();

                // نعمل فحص سريع علشان ما يبعتش حاجه فاضيه
                if (title.isEmpty && note.isEmpty) {
                  note = 'No content';
                }

                // نرجع القيم كـ Map للصفحة اللي قبلها
                Navigator.pop(context, {'title': title, 'note': note});
              },
              child: Ink(
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(225, 137, 81, 189),
                      Color.fromARGB(255, 62, 6, 165),
                      Color.fromARGB(255, 62, 6, 165),
                      Color.fromARGB(255, 212, 6, 147),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'save',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
