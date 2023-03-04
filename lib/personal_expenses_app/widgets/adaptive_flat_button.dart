import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function() handler;
  AdaptiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(onPressed: handler, child: Text(text))
        : TextButton(onPressed: handler, child: Text(text));
  }
}
