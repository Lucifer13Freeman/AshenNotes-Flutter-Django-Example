import 'package:ashen_notes/pages/create.dart';
import 'package:ashen_notes/models/note.dart';
import 'package:ashen_notes/pages/update.dart';
import 'package:ashen_notes/services/note_service.dart';
import 'package:ashen_notes/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomePage extends StatefulWidget 
{
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  List<Note> notes = [];
  NoteService noteService = NoteService(client: Client());

  @override
  void initState() 
  {
    _getNotes();
    super.initState();
  }

  _getNotes() async
  {
    notes = await noteService.getNotes() as List<Note>;
    setState(() {});
  }

  void _deleteNote(int id) async
  {
    noteService.deleteNote(id);
    await _getNotes();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async { _getNotes(); },
        child: ListView.builder(
          itemCount: notes.length, 
          itemBuilder: (BuildContext context, int index) 
          {
            return ListTile(
              title: Text((index + 1).toString() + '. ' + notes[index].body),
              subtitle: Text(Utils.dateFormat(DateTime.parse(notes[index].updatedAt))),
              onTap: () 
              {
                Navigator
                  .of(context)
                  .push(MaterialPageRoute(
                    builder: (context) => UpdatePage(
                      noteService: noteService, 
                      note: notes[index]
                    )
                  ));
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => { _deleteNote(notes[index].id) },
              ),
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator
                          .of(context)
                          .push(MaterialPageRoute(
                            builder: (context) => CreatePage(noteService: noteService)
                          )),
        tooltip: 'Create Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
