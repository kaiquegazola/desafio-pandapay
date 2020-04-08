import 'package:flutter/material.dart';

class DividerTile extends StatelessWidget {
  final String text;

  const DividerTile({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[
        Expanded(child: Divider()),
        SizedBox(
          width: 10,
        ),
        Text(
          this.text,
          style: TextStyle(fontSize: 12, color: Colors.black38),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(child: Divider()),
      ]),
    );
  }
}
