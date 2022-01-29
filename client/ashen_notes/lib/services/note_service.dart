import 'dart:convert';
import 'package:http/http.dart';
import 'package:ashen_notes/models/note.dart';
import '../configs/urls.dart';


class NoteService 
{
  final Client client;

  NoteService({
    required this.client,
  });
  
  Future<List> getNotes() async
  {
    List<Note> notes = [];

    List response = await json.decode(
      (await client.get(
        URL.getNotes()
      )).body
    );

    for (var element in response) {
      notes.add(Note.fromMap(element));
    }

    return notes;
  }

  void deleteNote(int id) async
  {
    await client.delete(URL.deleteNote(id));
  }

  void createNote(String body) async
  {
    await client.post(URL.createNote(), body: { 'body': body });
  }

  void updateNote(int id, String body) async
  {
    await client.put(URL.updateNote(id), body: { 'body': body });
  }
}
