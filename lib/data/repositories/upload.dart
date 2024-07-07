import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  FileUploadScreenState createState() => FileUploadScreenState();
}

class FileUploadScreenState extends State<FileUploadScreen> {
  String? _filePath;
  bool _uploading = false;

  Future<void> _pickAndUploadFile() async {
    setState(() {
      _uploading = true;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _filePath = file.path!;
      });
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/').child(file.name);
      UploadTask uploadTask = ref.putFile(File(_filePath!));

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await ref.getDownloadURL();

      if (downloadURL != null) {
        // File uploaded successfully, store URL in Firestore
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        await firestore.collection('songs').add({
          'name': file.name,
          'fileUrl': downloadURL,
        });
      } else {
        // Handle error while uploading file
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to upload file.'),
        ));
      }
    } else {
      // User canceled the file picker
    }
    setState(() {
      _uploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploading ? null : _pickAndUploadFile,
              child: _uploading
                  ? const CircularProgressIndicator()
                  : const Text('Pick and Upload File'),
            ),
            const SizedBox(height: 20),
            if (_filePath != null)
              Text('File Path: $_filePath')
            else
              const Text('No file selected'),
          ],
        ),
      ),
    );
  }
}
