import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserImagePickerState extends StatefulWidget {
 // UserImagePickerState(this.imagePickFn, {super.key});

  //final void Function(File pickedImage) imagePickFn;

  @override
  State<UserImagePickerState> createState() => _UserImagePickerStateState();
}

class _UserImagePickerStateState extends State<UserImagePickerState> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
     final pickedImageFile = await _picker.pickImage(source: ImageSource.gallery);
     setState(() {
       //pickedImage = pickedImageFile;
       _pickedImage = File(pickedImageFile!.path);
     });
      //widget.imagePickFn(pickedImageFile as File);
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
          _pickedImage == null ?   null : FileImage(_pickedImage!),
        ),
        //_pickedImage!= null ? Image.file(_pickedImage!) : const Text("Please up image"),
        TextButton.icon(

          onPressed: _pickImage,
          icon: const Icon(Icons.image),
          label:const Text('Add Image'),

        ),

      ],


    );
  }
  // Future _pickImageFromGallery() async{
  //  final returnedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
  //  setState(() {
  //    //_pickedImage = File(returnedImage!.path);
  //  });
  //
  // }

}
