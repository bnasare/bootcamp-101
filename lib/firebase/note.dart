class Note {
  late final String? id;
  final String title;
  final String? content;

  Note({
    required this.id,
    required this.title,
    this.content,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
      };

  static Note fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
      );
}
