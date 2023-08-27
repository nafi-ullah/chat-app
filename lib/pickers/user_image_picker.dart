import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePickerState extends StatefulWidget {
  UserImagePickerState(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePickerState> createState() => _UserImagePickerStateState();
}

class _UserImagePickerStateState extends State<UserImagePickerState> {
  late File _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
     final pickedImageFile = await _picker.pickImage(source: ImageSource.gallery);
     setState(() {
       _pickedImage = pickedImageFile as File;
     });
      widget.imagePickFn(pickedImageFile as File);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
          _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        TextButton.icon(

          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label:const Text('Add Image'),

        ),

      ],


    );
  }
}
