import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AlertDialogWidget extends StatelessWidget {
  String ?title;
  String ?subTitle;
  GestureTapCallback? onPositiveClick;

  AlertDialogWidget({this.title, this.subTitle, this.onPositiveClick});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(subTitle!,
        style: TextStyle(
        ),
      ),
      actions: [
        TextButton(
          child: Text(
              'Ok',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold)
          ),
          onPressed: onPositiveClick,
        ),
        // TextButton(
        //     child: Text(
        //       'Yes',
        //       style: TextStyle(
        //           fontSize: 16,
        //           color: Colors.green,
        //           fontWeight: FontWeight.bold),
        //     ),
        //     onPressed: onPositiveClick
        // ),
      ],
    );
  }
}