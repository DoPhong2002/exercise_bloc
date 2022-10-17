import 'dart:io';

import 'package:Flutter_father/modun/const.dart';
import 'package:Flutter_father/modun/service/api_service.dart';
import 'package:Flutter_father/modun/service/photo_service.dart';
import 'package:Flutter_father/modun/toast_overlay.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({Key? key}) : super(key: key);

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final picker = ImagePicker();
  var url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Column(
        children: [
          if(url.isNotEmpty)...{
            Image.network(url),
          },
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                selectImage(source: ImageSource.camera);
              }, child: const Text('Camera')),
              const SizedBox(
                width: 96,
              ),
              TextButton(onPressed: () {
                selectImage(source: ImageSource.gallery);
              }, child: const Text('Gallery')),
            ],
          ),
        ],
      ),
    );
  }

  Future selectImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
        imageQuality: 100,
        preferredCameraDevice: CameraDevice.front
      );
      if (image != null) {
        upLoad(image);
      }
    } catch (e) {
      ToastOverlay(context).show(message: "co loi roi", type: ToastType.error);
    }
  }

  void upLoad(XFile f) {
    print('path: ${f.name}');
    print('path: ${f.mimeType}');
    print('path: ${f.path}');
    // setState(() {
    //   file =f;
    // });
    apiService.upLoadAvatar(file: f).then((value){
      print('url: $baseUrl${value.path}');
      setState(() {
        url = '$baseUrl${value.path}';
      });
    }).catchError((e){
      ToastOverlay(context).show(message: e.toString(), type: ToastType.error);
    });
  }
}
