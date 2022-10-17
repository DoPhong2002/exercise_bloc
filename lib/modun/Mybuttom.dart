import 'package:flutter/material.dart';

///Code Thầy
class MyButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final bool enable;
  final VoidCallback onTap;

  const MyButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.red,
    this.enable = true,
    required this.onTap,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  var lock = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (!lock && widget.enable){
          setState(() {
            lock = true;
            widget.onTap();
          });
          Future.delayed(const Duration(milliseconds: 500), (){
            setState(() {
              lock = false;
            });
          });
        }
      },
      child: Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (lock || !widget.enable) ? Colors.grey[400] : widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

