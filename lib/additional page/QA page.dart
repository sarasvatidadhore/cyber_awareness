import 'package:flutter/material.dart';

class QAPage extends StatefulWidget {
  final String userQuestion;

  const QAPage({Key? key, required this.userQuestion}) : super(key: key);

  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.userQuestion,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Admin Answer:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _answerController,
              decoration: InputDecoration(
                hintText: 'Enter your answer...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to send the answer to the user
              },
              child: Text('Send Answer'),
            ),
          ],
        ),
      ),
    );
  }
}

