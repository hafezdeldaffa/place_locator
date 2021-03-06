import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 600,
      maxHeight: 500,
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: deviceSize.width * 0.45,
          height: deviceSize.height * 0.20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          height: 10,
        ),
        // ignore: deprecated_member_use
        FlatButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera_alt_rounded),
          label: Text('Take Picture'),
        ),
      ],
    );
  }
}
