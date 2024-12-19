import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_credential.dart';

Future<Person> signUp(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  // Assuming you have a way to convert UserCredential to Person
  // This might involve mapping userCredential.user details to a Person instance
  Person person = Person(
    // Map necessary fields from userCredential.user to Person
    userCredential.user!.uid,
    userCredential.user!.displayName!,
    userCredential.user!.email!,
  );

  await userCredential.user!.sendEmailVerification();

  // Save person details to Firestore
  await FirebaseFirestore.instance.collection('users').doc(person.uid).set({
    'uid': person.uid,
    'displayName': person.email.split('@')[0],
    'email': person.email,
  });

  return person;
}

Future<Person> signIn(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);

  // Assuming you have a way to convert UserCredential to Person
  // This might involve mapping userCredential.user details to a Person instance
  Person person = Person(
    // Map necessary fields from userCredential.user to Person
    userCredential.user!.uid,
    userCredential.user!.displayName!,
    userCredential.user!.email!,
  );

  // Optionally, you may want to update the Firestore document when the user signs in
  await FirebaseFirestore.instance.collection('users').doc(person.uid).update({
    'displayName': person.email.split('@')[0],
    'email': person.email,
  });

  return person;
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
