import 'package:flutter/material.dart';

class Tesst extends StatefulWidget {
  const Tesst({Key? key}) : super(key: key);

  @override
  State<Tesst> createState() => _TesstState();
}

class _TesstState extends State<Tesst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(onPressed: Showdialog, child: const Text('con chim'))),
    );
  }

  void Showdialog () {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Colors.grey.withOpacity(0.2),
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        pageBuilder: (_, __, ___) {
          return Container(
            alignment: Alignment.center,
            child:   Material(
              color: Colors.transparent,
              child: MyAvtDialog(child: Container(
                width: double.infinity,
                height: 500,
                color: Colors.yellow,
              ),),
            ),
          );
        });
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
