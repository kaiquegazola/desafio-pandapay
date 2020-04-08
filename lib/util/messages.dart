import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Messages {
  sendSuccessToast(BuildContext context, String title, String content) {
    showFlash(
      context: context,
      duration: Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          onTap: () => controller.dismiss(),
          backgroundColor: Colors.green,
          borderRadius: BorderRadius.circular(4.0),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              message: Text(content),
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  sendWarningToast(BuildContext context, String title, String content) {
    showFlash(
      context: context,
      duration: Duration(seconds: 3),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          onTap: () => controller.dismiss(),
          backgroundColor: Colors.orange,
          borderRadius: BorderRadius.circular(4.0),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: FlashBar(
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              message: Text(content),
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  static ProgressDialog loadingMessage(BuildContext context, String message) {
    ProgressDialog pr = ProgressDialog(context, isDismissible: false);
    pr.style(
        progressWidget: Container(
            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()));
    pr.update(message: message);
    return pr;
  }
}
