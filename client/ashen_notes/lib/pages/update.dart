import 'package:ashen_notes/models/note.dart';
import 'package:ashen_notes/services/note_service.dart';
import 'package:flutter/material.dart';


class UpdatePage extends StatefulWidget
{
  final NoteService noteService;
  final Note note;

  const UpdatePage(
  { 
    Key? key,
    required this.noteService,
    required this.note
  }) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage>
{
  TextEditingController controller = TextEditingController();

  @override
  void initState() 
  {
    controller.text = widget.note.body;
    super.initState();
  }

  void _updateNote(String body) async
  {
    widget.noteService.updateNote(widget.note.id, body);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Note"),
      ),
      body: 
      Container(
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()
                {
                  _updateNote(controller.text);
                  Navigator.pop(context);
                }, 
                child: const Text('Update'),
              )
            )
          ],
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
      ),
    );
  }
}