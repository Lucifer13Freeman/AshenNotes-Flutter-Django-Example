import 'package:ashen_notes/utils/utils.dart';


class URL
{
  static const Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  static const String mobileBaseUrl = 'http://10.0.2.2:8000';
  static const String webBaseUrl = 'http://127.0.0.1:8000';

  static String baseUrl = Utils.isMobile() 
              ? 'http://10.0.2.2:8000' 
              : 'http://127.0.0.1:8000';

  static Uri getNotes() 
  { return Uri.parse('$baseUrl/notes/'); }

  static Uri getNote(int id) 
  { return Uri.parse('$baseUrl/notes/$id/'); }

  static Uri createNote() 
  { return Uri.parse('$baseUrl/notes/create/'); }
  
  static Uri updateNote(int id) 
  { return Uri.parse('$baseUrl/notes/$id/update/'); }

  static Uri deleteNote(int id) 
  { return Uri.parse('$baseUrl/notes/$id/delete/'); }
}