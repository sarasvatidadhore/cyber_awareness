import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'We appreciate your feedback!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement feedback submission logic here
                String feedback = _feedbackController.text;
                // You can print or send the feedback to a server
                print('Feedback: $feedback');

                // Add feedback to Firestore
                FirebaseFirestore.instance.collection('feedback').add({
                  'feedback': feedback,
                  'timestamp': Timestamp.now(), // Optionally, you can add a timestamp
                }).then((value) {
                  // Show a confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Feedback Submitted'),
                        content: Text(
                            'Thank you for your feedback! We appreciate it.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  // Clear the feedback field after submission
                  _feedbackController.clear();
                }).catchError((error) {
                  // Handle error
                  print('Failed to submit feedback: $error');
                  // Optionally, show an error dialog
                });
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
