import 'package:Flutter_father/MyTextField.dart';
import 'package:Flutter_father/modun/const.dart';
import 'package:Flutter_father/modun/service/api_service.dart';
import 'package:Flutter_father/modun/service/photo_service.dart';
import 'package:Flutter_father/modun/toast_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../modun/Mybuttom.dart';
import '../report_model.dart';
import '../report_page.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({Key? key}) : super(key: key);

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  List? itemListSelected = [];
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerContent = TextEditingController();
  bool stateInit = true;
  final picker = ImagePicker();
  var url = "";

  void myInitState(BigCubit newFeedCubit) {
    newFeedCubit.getMyAvts();
  }

  @override
  Widget build(BuildContext context) {
    final cubitProvider = BlocProvider.of<BigCubit>(context);
    if (stateInit) {
      stateInit = false;
      myInitState(cubitProvider);
      print('lần 1');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD Report'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
                );
              },
              icon: const Icon(Icons.report))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleAddReport(),
                  const SizedBox(height: 16),
                  buildListImageAdded(),
                  const SizedBox(height: 16),
                  buildImageAdd(),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              buildOntapAdd()
            ],
          ),
        ),
      ),
    );
  }

  Future upLoadImage({required ImageSource source}) async {
    try {
      final image = await picker.pickImage(
        source: source,
        imageQuality: 100,
        preferredCameraDevice: CameraDevice.rear,
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
      itemListSelected?.add('$baseUrl${value.path}');
      setState(() {
        url = '$baseUrl${value.path}';
      });
    }).catchError((e) {
      ToastOverlay(context).show(message: e.toString(), type: ToastType.error);
    });
  }

  Widget buildOntapAdd() {
    final cubitProvider = BlocProvider.of<BigCubit>(context);
    return MyButton(
      text: 'Them',
      backgroundColor: Colors.cyanAccent,
      textColor: Colors.black,
      onTap: () {
        print('itemListSelected 1: $itemListSelected');
        if (_controllerTitle.text.isNotEmpty &&
                _controllerTitle.text.isNotEmpty ||
            _controllerTitle.text.isNotEmpty) {
          cubitProvider.addListReport(
            _controllerTitle.text,
            _controllerContent.text,
            itemListSelected!,
          );
        }
        cubitProvider.listReport = List.from(cubitProvider.listAddReport);
        itemListSelected = [];
        print('itemListSelected 2: $itemListSelected');
        _controllerContent.text = '';
        _controllerTitle.text = '';
      },
    );
  }

  Widget buildTitleAddReport() {
    return Column(
      children: [
        Column(
          children: [
            MyTextField(
              controller: _controllerTitle,
              textAlign: TextAlign.center,
              hintText: 'Tiêu đề',
              labelText: 'Tiêu đề',
              maxLines: 1,
              minLines: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            MyTextField(
              controller: _controllerContent,
              hintText: 'hello',
              labelText: 'Noi dung',
              minLines: 5,
              maxLines: 10,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildListImageAdded() {
    final cubitProvider = BlocProvider.of<BigCubit>(context);
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemListSelected?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (_, index) {
        final image = itemListSelected?[index];
        return ImageAdded(index);
      },
    );
  }

  Widget buildImageAdd() {
    return InkWell(
      onTap: showBottomSheet,
      child: SizedBox(
        height: 80,
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/icons/imageNew.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget ImageAdded(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        itemListSelected?[index],
        fit: BoxFit.cover,
        width: 90,
        height: 90,
      ),
    );
  }

  Widget buildPopUp() {
    return Container(
      height: 200,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 10),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyButton(
            text: "Camera",
            onTap: () {
              if (url.isNotEmpty) {}
              upLoadImage(source: ImageSource.camera);
            },
            textColor: Colors.black,
            backgroundColor: Colors.cyanAccent,
          ),
          MyButton(
            text: "Gallery",
            onTap: () {
              if (url.isNotEmpty) {}
              upLoadImage(source: ImageSource.gallery);
            },
            textColor: Colors.black,
            backgroundColor: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return buildPopUp();
      },
    );
  }
}
