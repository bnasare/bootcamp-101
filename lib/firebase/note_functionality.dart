import 'package:bootcamp_101/firebase/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Note> saveNote(Note note) async {
  final docNote = FirebaseFirestore.instance.collection('notes').doc();
  note.id = docNote.id;
  await docNote.set(note.toJson());
  return note;
}


Future<List<Note>> getNotes() async {
  final notes = await FirebaseFirestore.instance.collection('notes').get();
  return notes.docs.map((doc) => Note.fromJson(doc.data())).toList();
}

Future<void> deleteNote(String id) async {
  await FirebaseFirestore.instance.collection('notes').doc(id).delete();
}

Future<void> updateNote(Note note) async {
  await FirebaseFirestore.instance
      .collection('notes')
      .doc(note.id)
      .update(note.toJson());
}

Future<Note> getNoteById(String id) async {
  final docNote =
      await FirebaseFirestore.instance.collection('notes').doc(id).get();
  return Note.fromJson(docNote.data()!);
}

Future<void> deleteAllNotes() async {
  final notes = await getNotes();
  for (final note in notes) {
    await deleteNote(note.id ?? '');
  }
}

Future<void> updateAllNotes() async {
  final notes = await getNotes();
  for (final note in notes) {
    await updateNote(note);
  }
}

Future<void> addNote(Note note) async {
  await FirebaseFirestore.instance.collection('notes').add(note.toJson());
}
