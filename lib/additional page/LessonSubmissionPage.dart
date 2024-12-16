import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class SubmitLessonScreen extends StatefulWidget {
//   @override
//   _SubmitLessonScreenState createState() => _SubmitLessonScreenState();
// }
//
// class _SubmitLessonScreenState extends State<SubmitLessonScreen> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController(); // Add new field
//
//   List<String> fraudTypes = ['Email Fraud', 'Financial Fraud', 'Credit Card Fraud'];
//   String selectedFraudType = 'Email Fraud'; // Default selection
//
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void _submitLesson() async {
//     String title = _titleController.text;
//     String description = _descriptionController.text;
//     String category = _categoryController.text; // Access new field
//     String timestamp = DateTime.now().toString();
//
//     try {
//       await _firestore.collection('lessons').add({
//         'fraudType': selectedFraudType,
//         'description': description,
//         'timestamp': timestamp,
//         'title': title, // Add new field
//         'category': category, // Add new field
//       });
//       print('Lesson submitted successfully.');
//     } catch (e) {
//       print('Error submitting lesson: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Submit Your Lesson'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Title field
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Box to display fraud types
//             Container(
//               margin: EdgeInsets.only(bottom: 20),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Select Fraud Type:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   DropdownButton<String>(
//                     value: selectedFraudType,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedFraudType = newValue!;
//                       });
//                     },
//                     items: fraudTypes.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Box for description
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter description',
//                   border: InputBorder.none,
//                 ),
//                 maxLines: 4,
//               ),
//             ),
//             SizedBox(height: 10),
//
//             // Category field (new field)
//             TextField(
//               controller: _categoryController,
//               decoration: InputDecoration(
//                 labelText: 'Category',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             ElevatedButton(
//               onPressed: _submitLesson,
//               child: Text('Submit Lesson'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LessonUploadPage extends StatefulWidget {
  @override
  _LessonUploadPageState createState() => _LessonUploadPageState();
}

class _LessonUploadPageState extends State<LessonUploadPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _uploadLesson() {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      FirebaseFirestore.instance.collection('lessons').add({
        'title': title,
        'description': description,
      }).then((value) {
        // Lesson uploaded successfully
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lesson uploaded successfully')),
        );
        _titleController.clear();
        _descriptionController.clear();
      }).catchError((error) {
        // Error uploading lesson
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload lesson: $error')),
        );
      });
    } else {
      // Fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Lesson Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _uploadLesson,
              child: Text('Submit Your Lesson'),
            ),
          ],
        ),
      ),
    );
  }
}