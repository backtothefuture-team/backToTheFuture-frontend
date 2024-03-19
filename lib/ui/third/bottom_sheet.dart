import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.camera_alt_outlined
                  )
              ),

              IconButton(
                  onPressed: (){},
                  icon: Icon(
                      Icons.photo_library
                  )
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

    if( pickedFile != null ) {

    }
  }
}
