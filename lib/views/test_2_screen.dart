import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

import '../app/routes.dart';

class Test2Screen extends StatefulWidget {
  const Test2Screen({
    super.key,
  });

  @override
  State<Test2Screen> createState() => _Test2ScreenState();
}

class _Test2ScreenState extends State<Test2Screen> {
  File? _selectedImage;

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
      // allowMultiple: true,
    );

    if (result != null && result.files.single.path != null) {
      // Load result
      PlatformFile fileResult = result.files.first;
      print(fileResult.name);
      print(fileResult.size);
      print(fileResult.extension);

      // File
      File file = File(result.files.single.path!);
      setState(() {
        _selectedImage = file;
      });
    } else {
      // User canceled the picker
    }
  }

  // late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _selectedImage != null
              ? Image.file(_selectedImage!)
              : const Text('Please selected an image'),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Get.toNamed(Routes.test3Screen);
            },
            child: const Text('Go to webview'),
          ),
          FilledButton(
            onPressed: () async {
              await _pickFile();
            },
            child: const Text('Select File'),
          ),
          FilledButton(
            onPressed: () async {
              // await getLostData();
              await _pickImageFromGallery();
            },
            child: const Text('Select Image'),
          ),
          FilledButton(
            onPressed: () async {
              // Share.share('check out my website https://example.com',
              //     subject: 'Look what I made!');

              final result = await Share.shareWithResult(
                  'check out my website https://example.com',
                  subject: 'Look what I made!');

              if (result.status == ShareResultStatus.success) {
                print('Thank you for sharing my website!');
              } else {
                print('No success');
              }
            },
            child: const Text('Share'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        // flex: 2,
                        onPressed: (_) => doNothing(index),
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.archive,
                        label: 'Archive',
                      ),
                      SlidableAction(
                        onPressed: (_) {},
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.save,
                        label: 'Save',
                      ),
                    ],
                  ),
                  child: Card(child: ListTile(title: Text('Slide me $index'))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void doNothing(int index) {
  print('$index');
}
