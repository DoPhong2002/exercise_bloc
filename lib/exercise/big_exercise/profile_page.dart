import 'package:Flutter_father/exercise/big_exercise/stream/stream_ex.dart';
import 'package:Flutter_father/modun/const.dart';
import 'package:Flutter_father/modun/service/api_service.dart';
import 'package:Flutter_father/modun/service/photo_service.dart';
import 'package:Flutter_father/modun/toast_overlay.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../MyTextField.dart';
import '../../modun/Mybuttom.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker picker = ImagePicker();

  var url = '';
  late EXBloc bloc;

  @override
  void initState() {
    bloc = EXBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tài khoản',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            buildAvt(),
            const SizedBox(
              height: 32,
            ),
            buildTextFields(),
            const SizedBox(
              height: 32,
            ),
            MyButton(
                text: 'Lưu',
                backgroundColor: Colors.cyanAccent,
                textColor: Colors.white,
                onTap: () {})
          ],
        ),
      ),
    );
  }

  Widget buildAvt() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: imageAVT(),
            // Column(
            //   children: [
            //     if (url.isNotEmpty) ...{Image.network(url)},
            //   ],
          ),
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: IconButton(
            onPressed: () {
              upLoadImage(source: ImageSource.camera);
            },
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.cyanAccent,
            ),
          ),
        ),
      ],
    );
  }

  Future upLoadImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 10,
      );
      if (image != null) {
        upLoad(image);
      }
    } catch (e) {
      ToastOverlay(context).show(message: "co loi roi", type: ToastType.error);
    }
  }

  void upLoad(XFile f) {
    apiService.upLoadAvatar(file: f).then((value) {
      print('$baseUrl${value.path}');
      setState(() {
        url = '$baseUrl${value.path}';
        bloc.getUrl(url);
      });
    }).catchError((e) {
      ToastOverlay(context).show(message: e, type: ToastType.error);
    });
  }

  Widget imageAVT() {
    return StreamBuilder<String>(
      stream: bloc.EXstream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Image.network(bloc.url, fit: BoxFit.cover,),
            ),
          );
          // print('urlImage : ${bloc.url}');

        }
        return Container(color: Colors.yellow,);
      },
    );
  }

  Widget buildTextFields() {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        MyTextField(labelText: 'Họ & tên'),
        MyTextField(
          labelText: 'Ngày sinh',
          keyboardType: TextInputType.datetime,
        ),
        MyTextField(labelText: 'Địa chỉ'),
        MyTextField(
          labelText: 'Số điện thoại',
          keyboardType: TextInputType.number,
        ),
        MyTextField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  void showdialogAvt() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.grey.withOpacity(0.2),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: MyAvtDialog(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  width: 300,
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Thay đổi ảnh đại diện',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Huy')),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Yes')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyAvtDialog extends StatefulWidget {
  final Widget child;

  const MyAvtDialog({super.key, required this.child});

  @override
  State<MyAvtDialog> createState() => _MyAvtDialogState();
}

class _MyAvtDialogState extends State<MyAvtDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
