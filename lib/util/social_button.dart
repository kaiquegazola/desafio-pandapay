import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final Color _color;
  final IconData _icon;
  final String _name;
  final Function _action;

  SocialButton(this._color, this._icon, this._name, this._action);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: _color,
      onPressed: (){
        _action();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FaIcon(
            _icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            _name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
