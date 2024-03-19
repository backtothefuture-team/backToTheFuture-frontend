import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({super.key});

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    final imageSize = MediaQuery.of(context).size.width * 0.2;

    return Column(
      children: [profileImage(context, imageSize)],
    );
  }

  Widget profileImage(BuildContext context, double imageSize) {
    return Container(
      child: Stack(
        children: [
          if (_imageFile == null)
            Container(
              constraints: BoxConstraints(
                minWidth: imageSize,
                minHeight: imageSize,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/btf_logo.png'),
                ),
              ),
            )
          else
            Container(
              constraints: BoxConstraints(
                minWidth: imageSize,
                minHeight: imageSize,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(File(_imageFile!.path)),
                ),
              ),
            ),

          Positioned(
            right: 20,
            bottom: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(Icons.camera_alt),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  _pickedImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_outlined),
              ),
              IconButton(
                onPressed: () {
                  _pickedImage(ImageSource.gallery);
                },
                icon: Icon(Icons.photo_library),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickedImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택 안 함');
      }
    }
  }
}
