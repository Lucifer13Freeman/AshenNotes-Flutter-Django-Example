import 'package:ashen_notes/services/note_service.dart';
import 'package:flutter/material.dart';


class CreatePage extends StatefulWidget
{
  final NoteService noteService;

  const CreatePage(
  { 
    Key? key,
    required this.noteService
  }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage>
{
  TextEditingController controller = TextEditingController();

  void _createNote(String body) async
  {
    widget.noteService.createNote(body);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Note"),
      ),
      body: Container(
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
                  _createNote(controller.text);
                  Navigator.pop(context);
                }, 
                child: const Text('Create'),
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