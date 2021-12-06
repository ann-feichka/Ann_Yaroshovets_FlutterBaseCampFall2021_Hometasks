import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:flutter/material.dart';

Widget buildFAB(AppTab tab) => AnimatedContainer(
  duration: Duration(milliseconds: 200),
  curve: Curves.linear,
  width: 50,
  height: 50,
  child: FloatingActionButton.extended(
    heroTag: "FAB${tab}",
    onPressed: () {},
    icon: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(Icons.add),
    ),
    label: SizedBox(),
  ),
);