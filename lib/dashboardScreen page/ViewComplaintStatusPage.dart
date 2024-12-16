import 'package:flutter/material.dart';

class ViewComplaintStatusScreen extends StatefulWidget {
  const ViewComplaintStatusScreen({Key? key}) : super(key: key);

  @override
  _ViewComplaintStatusScreenState createState() =>
      _ViewComplaintStatusScreenState();
}

class _ViewComplaintStatusScreenState
    extends State<ViewComplaintStatusScreen> {
  TextEditingController _complaintIdController = TextEditingController();
  String _complaintStatus = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Complaint Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _complaintIdController,
              decoration: InputDecoration(
                labelText: 'Enter Complaint ID',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fetch complaint status based on ID
                // Replace this logic with your actual implementation
                setState(() {
                  _complaintStatus = 'Complaint Status: Resolved'; // Example status
                });
              },
              child: Text('View Status'),
            ),
            SizedBox(height: 20),
            if (_complaintStatus.isNotEmpty)
              Text(
                _complaintStatus,
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
