import 'dart:convert';


class Note 
{
  int id;
  String body;
  String createdAt;
  String updatedAt;
  
  Note(
  {
    required this.id,
    required this.body,
    required this.createdAt,
    required this.updatedAt
  });

  Note copyWith(
  {
    int? id,
    String? body,
    String? createdAt,
    String? updatedAt
  }) {
    return Note(
      id: id ?? this.id,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() 
  {
    return {
      'id': id,
      'body': body,
      'created_at': createdAt,
      'updated_at': updatedAt
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) 
  {
    return Note(
      id: map['id']?.toInt() ?? 0,
      body: map['body'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() => 'Note(id: $id, body: $body, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(Object other) 
  {
    if (identical(this, other)) return true;
  
    return other is Note &&
      other.id == id &&
      other.body == body &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ body.hashCode;
}
