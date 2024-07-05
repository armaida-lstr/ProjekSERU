import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Wizard2 extends StatefulWidget {
  final Function nextPage;
  final Function previousPage;
  final Map<String, dynamic> formData;

  Wizard2(
      {required this.nextPage,
      required this.previousPage,
      required this.formData});

  @override
  _Wizard2State createState() => _Wizard2State();
}

class _Wizard2State extends State<Wizard2> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selfie;
  XFile? _ktp;
  XFile? _bebas;

  Future<void> _pickImage(ImageSource source, String imageType) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        if (imageType == 'selfie') {
          _selfie = image;
          widget.formData['selfie'] = image.path;
        } else if (imageType == 'ktp') {
          _ktp = image;
          widget.formData['ktp'] = image.path;
        } else if (imageType == 'bebas') {
          _bebas = image;
          widget.formData['bebas'] = image.path;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Upload Photos'),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, 'selfie'),
            child: Text('Upload Selfie'),
          ),
          _selfie != null ? Image.file(File(_selfie!.path)) : Container(),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, 'ktp'),
            child: Text('Upload KTP'),
          ),
          _ktp != null ? Image.file(File(_ktp!.path)) : Container(),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera, 'bebas'),
            child: Text('Upload Foto Bebas'),
          ),
          _bebas != null ? Image.file(File(_bebas!.path)) : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.previousPage();
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.nextPage();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
