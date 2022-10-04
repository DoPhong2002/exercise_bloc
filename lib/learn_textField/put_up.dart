import 'package:Flutter_father/MyTextField.dart';
import 'package:flutter/material.dart';

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pop Up'),
      ),
      body: Column(
        children: [
          TextButton(onPressed: showBottomSheet, child: const Text('ALo')),
          TextButton(onPressed: showCustomDialog, child: const Text('Dialog'))
        ],
      ),
    );
  }

  void showCustomDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.grey.shade50,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          child: Material(
            child: Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NoiBai Taxi',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Xac nhan dang xuat'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Huy')),
                      TextButton(
                          onPressed: () {}, child: const Text('Xac Nhan')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPopUp() {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 10),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        children: const [
          MyTextField(
            labelText: 'Ma so thue',
            autoFocus: true,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 16,
          ),
          MyTextField(
            labelText: 'Ma so thue',
          ),
          SizedBox(
            height: 16,
          ),
          MyTextField(
            labelText: 'Ma so thue',
          ),
          SizedBox(
            height: 16,
          ),
          MyTextField(
            labelText: 'Ma so thue',
          ),
          SizedBox(
            height: 16,
          ),
          MyTextField(
            labelText: 'Ma so thue',
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
        });
  }
}
