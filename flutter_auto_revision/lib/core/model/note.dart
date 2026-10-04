class Note {
  final int? id;
  final String subject;
  final String chapter;
  final String topic;
  final String note;

  Note({

    this.id,
    required this.subject,
    required this.chapter,
    required this.topic,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'chapter': chapter,
      'topic': topic,
      'note': note,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      subject: map['subject'],
      chapter: map['chapter'],
      topic: map['topic'],
      note: map['note'],
    );
  }
}