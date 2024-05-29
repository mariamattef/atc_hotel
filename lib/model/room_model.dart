import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Room {
  bool? isExpanded;
  Widget? header;
  String? selection;
  String? body;

  Room(
    this.isExpanded,
    this.header,
    this.selection,
    this.body,
  );
}
