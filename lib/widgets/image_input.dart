import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onSavedImage;

  ImageInput(this.onSavedImage);

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
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedFile = await _storedImage.copy('${appDir.path}/$fileName');
    widget.onSavedImage(savedFile);
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
            border: Border.all(width: 1, color: Colors.black),
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
        TextButton.icon(
          onPressed: _takePicture,
          icon: Icon(
            Icons.camera_alt_rounded,
            color: Theme.of(context).primaryColor,
          ),
          label: Text(
            'Take Picture',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
