import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiKeyStorage extends StatefulWidget {
  @override
  _ApiKeyStorageState createState() => _ApiKeyStorageState();
}

class _ApiKeyStorageState extends State<ApiKeyStorage> {
  TextEditingController _apiKeyController = TextEditingController();
  String _storedApiKey = "AIzaSyAj9o6IZEDNbLQ6qY_gryf8JZpQ7OOUEjY";

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  // Load the API key from local storage
  _loadApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedApiKey = prefs.getString('api_key') ?? "";
      GEMINI_API_KEY = _storedApiKey.toString();
    });
  }

  // Save the API key to local storage
  _saveApiKey(String apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_key', apiKey);
    setState(() {
      _storedApiKey = apiKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        foregroundColor: Colors.white,
        title: Text('API Key Storage'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'IF ITS NOT WORKING TRY CHANGING THE API KEY',
                style: TextStyle(fontSize: 18, color: Colors.red.shade800),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Stored API Key:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueGrey.shade900),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  GEMINI_API_KEY,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _apiKeyController,
              decoration: InputDecoration(
                labelText: 'Enter API Key',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _saveApiKey(_apiKeyController.text);
                GEMINI_API_KEY = _storedApiKey.toString();
              },
              child: Center(child: Text('Save API Key')),
            ),
          ],
        ),
      ),
    );
  }
}
