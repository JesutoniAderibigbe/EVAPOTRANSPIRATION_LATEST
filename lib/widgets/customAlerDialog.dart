//build custom alert dialog

import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final Function? onPositiveButtonPressed;
  final Function? onNegativeButtonPressed;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        if (negativeButtonText != null)
          TextButton(
            onPressed: () {
              if (onNegativeButtonPressed != null) {
                onNegativeButtonPressed!();
              }
              Navigator.of(context).pop();
            },
            child: Text(negativeButtonText!),
          ),
        if (positiveButtonText != null)
          TextButton(
            onPressed: () {
              if (onPositiveButtonPressed != null) {
                onPositiveButtonPressed!();
              }
              Navigator.of(context).pop();
            },
            child: Text(positiveButtonText!),
          ),
      ],
    );
  }
}




