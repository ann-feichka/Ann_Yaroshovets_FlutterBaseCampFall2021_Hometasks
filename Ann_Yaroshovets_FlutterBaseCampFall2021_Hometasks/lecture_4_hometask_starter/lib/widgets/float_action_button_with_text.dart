import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:flutter/material.dart';

Widget buildExtendedFAB(AppTab tab) => AnimatedContainer(
  duration: Duration(milliseconds: 200),
  curve: Curves.easeInToLinear,
  width: 150,
  height: 50,
  child: FloatingActionButton.extended(
    heroTag: "${tab}ext",
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Center(
      child: Text(
        "Add new",
      ),
    ),
  ),
);