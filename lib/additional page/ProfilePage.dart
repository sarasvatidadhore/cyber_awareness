import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../dashboardScreen page/dashboard_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _email = '';
  int _age = 0;
  String _address = '';
  File? _image;

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _getImageFromGallery,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null ? Icon(Icons.person, size: 50) : null,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _age = int.tryParse(value) ?? 0;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save profile logic here
                // For simplicity, just print values here
                print('Name: $_name');
                print('Email: $_email');
                print('Age: $_age');
                print('Address: $_address');
                // Update profile picture and name in the drawer
                setState(() {
                  // Update profile picture and name
                  // _profilePicture = updatedProfilePicture;
                  // _name = updatedName;
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Profile saved successfully!'),
                ));
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
