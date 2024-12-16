import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SP extends StatelessWidget {
  const SP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share and Learn Lesson"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            Text("Case 1"),
            _buildImageContainer(
              "assets/images/news3.png",
            ),
            SizedBox(height: 50),
            Text("Case 2"),
            _buildImageContainer(
              "assets/images/news1.png",
            ),
            SizedBox(height: 20),
            // Added a button only below Case 2
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page for lesson submission
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubmitLessonScreen()),
                );
              },
              child: Text("Submit Your Lesson"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), // Adjust this as needed
        ),
        child: GestureDetector(
          onTap: () {},
          child: Image.asset(
            imagePath,
            width: 400,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';


class SubmitLessonScreen extends StatefulWidget {
  @override
  _SubmitLessonScreenState createState() => _SubmitLessonScreenState();
}

class _SubmitLessonScreenState extends State<SubmitLessonScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController(); // Add new field

  List<String> fraudTypes = ['Email Fraud', 'Financial Fraud', 'Credit Card Fraud'];
  String selectedFraudType = 'Email Fraud'; // Default selection

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submitLesson() async {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String category = _categoryController.text; // Access new field
    String timestamp = DateTime.now().toString();

    try {
      await _firestore.collection('lessons').add({
        'fraudType': selectedFraudType,
        'description': description,
        'timestamp': timestamp,
        'title': title, // Add new field
        'category': category, // Add new field
      });
      print('Lesson submitted successfully.');
    } catch (e) {
      print('Error submitting lesson: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Your Lesson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title field
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            // Box to display fraud types
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Fraud Type:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedFraudType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFraudType = newValue!;
                      });
                    },
                    items: fraudTypes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Box for description
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter description',
                  border: InputBorder.none,
                ),
                maxLines: 4,
              ),
            ),
            SizedBox(height: 10),

            // Category field (new field)
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submitLesson,
              child: Text('Submit Lesson'),
            ),
          ],
        ),
      ),
    );
  }
}