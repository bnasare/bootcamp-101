import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final formKey = GlobalKey<FormState>();
  String usermane = '';
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forms'),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                textInputAction: TextInputAction.next,
                // enabled: false,
                autofocus: true,
                controller: nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    usermane = value;
                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Kofi Asomaning',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText: 'Username',
                    prefixIcon: (Icon(IconlyLight.profile))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onEditingComplete: () {
                  log('Done Editing');
                  FocusScope.of(context).unfocus();
                },
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: (Icon(IconlyLight.message))),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: (Icon(IconlyLight.password))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // if (passwordController.text.isEmpty) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Password is empty')),
                  //   );
                  //   return;
                  // }
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is valid')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form is invalid')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              Text(usermane),
              const SearchBar(
                hintText: 'Enter your search query',
              )
            ],
          ),
        ),
      ),
    );
  }
}
