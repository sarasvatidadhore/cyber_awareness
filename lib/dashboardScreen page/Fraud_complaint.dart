// import 'package:flutter/material.dart';
//
// class FraudComplaintPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fraud Complaint'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Submit Fraud Complaint',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Subject',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               maxLines: 5,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement complaint submission logic
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FraudComplaintPage extends StatefulWidget {
//   @override
//   FraudComplaintPageState createState() => FraudComplaintPageState();
// }
//
// class FraudComplaintPageState extends State<FraudComplaintPage> {
//   List<File> _files = [];
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String _subject = '';
//   String _description = '';
//
//   // Initialize Firebase if not already done
//   Future<void> _initializeFirebase() async {
//     await Firebase.initializeApp();
//   }
//
//   void _openFileExplorer() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'mp4', 'mov', 'avi', 'mp3', 'wav'],
//     );
//
//     if (result != null) {
//       setState(() {
//         _files.add(File(result.files.single.path!));
//       });
//     }
//   }
//
//   void _submitComplaint() async {
//     // Validate subject and description (optional)
//     if (_subject.isEmpty || _description.isEmpty) {
//       // Show an error message
//       return;
//     }
//
//     // Upload proof files to storage (implementation omitted for brevity)
//     // ... Upload logic for files ...
//
//     // Get current user details (replace with your user retrieval logic)
//     final username = 'your_username'; // Replace with actual username retrieval
//
//     // Create a new document in the user's collection
//     await _firestore.collection('users').doc(username).collection('complaints').add({
//       'title': _subject,
//       'description': _description,
//       // Add timestamp or other relevant details here
//     });
//
//     // Clear form data and uploaded files
//     setState(() {
//       _subject = '';
//       _description = '';
//       _files.clear();
//     });
//
//     // Show a success message
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeFirebase(); // Call initializeFirebase on initState
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fraud Complaint'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Submit Fraud Complaint',
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               onChanged: (value) => setState(() => _subject = value), // Update subject on change
//               decoration: InputDecoration(
//                 labelText: 'Subject',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               maxLines: 5,
//               onChanged: (value) => setState(() => _description = value), // Update description on change
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _openFileExplorer,
//               child: Text('Upload Proof'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _files.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     title: Text(_files[index].path),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitComplaint,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FraudComplaintPage extends StatefulWidget {
  @override
  FraudComplaintPageState createState() => FraudComplaintPageState();
}

class FraudComplaintPageState extends State<FraudComplaintPage> {
  List<File> _files = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _subject = '';
  String _description = '';

  // Initialize Firebase if not already done
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif', 'mp4', 'mov', 'avi', 'mp3', 'wav'],
    );

    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  void _submitComplaint() async {
    // Validate subject and description (optional)
    if (_subject.isEmpty || _description.isEmpty) {
      // Show an error message
      return;
    }

    // Upload proof files to storage (implementation omitted for brevity)
    // ... Upload logic for files ...

    // Get current user details (replace with your user retrieval logic)
    final username = 'your_username'; // Replace with actual username retrieval

    // Create a new document in the user's collection
    await _firestore.collection('users').doc(username).collection('complaints').add({
      'title': _subject,
      'description': _description,
      // Add timestamp or other relevant details here
    });

    // Clear form data and uploaded files
    setState(() {
      _subject = '';
      _description = '';
      _files.clear();
    });

    // Show a success message
  }

  @override
  void initState() {
    super.initState();
    _initializeFirebase(); // Call initializeFirebase on initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fraud Complaint'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( // Wrap your Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Submit Fraud Complaint',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) => setState(() => _subject = value),
                decoration: InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                maxLines: 5,
                onChanged: (value) => setState(() => _description = value),
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _openFileExplorer,
                child: Text('Upload Proof'),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _files.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_files[index].path),
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitComplaint,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FraudComplaintPage(),
  ));
}
