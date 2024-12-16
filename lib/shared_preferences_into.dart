import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDemoApp extends StatefulWidget {
  const LocalStorageDemoApp({super.key});

  @override
  State<LocalStorageDemoApp> createState() => _LocalStorageDemoAppState();
}

class _LocalStorageDemoAppState extends State<LocalStorageDemoApp> {
  final TextEditingController _textController = TextEditingController();
  String _storedData = 'No data saved yet';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  //! Save data to SharedPreferences
  Future<void> saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedData', _textController.text);
    setState(() {
      _storedData = _textController.text;
    });
    _textController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  //! Load data from SharedPreferences
  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedData = prefs.getString('savedData') ?? 'No data saved yet';
    });
  }

  //! Delete data from SharedPreferences
  Future<void> deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('savedData');
    setState(() {
      _storedData = 'Oh, youve cleared me!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: const Text('Local Storage Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                    labelText: 'Enter some text',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: saveData, child: const Text('Save')),
              ElevatedButton(
                  onPressed: () {
                    loadData();
                  },
                  child: const Text('Load')),
              ElevatedButton(
                  onPressed: deleteData, child: const Text('Delete')),
              const SizedBox(height: 20),
              const Text('Stored Data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(_storedData),
            ],
          ),
        ),
      ),
    );
  }
}
