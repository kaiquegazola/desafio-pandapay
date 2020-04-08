import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
              message: Text(content),
              icon: Icon(Icons.check, color: Colors.white,),
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
              title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
              message: Text(content),
              icon: Icon(Icons.check, color: Colors.white,),
            ),
          ),
        );
      },
    );
  }


}