import 'package:flutter/material.dart';

double height(BuildContext context) => MediaQuery.of(context).size.height;
double width(BuildContext context) => MediaQuery.of(context).size.width;

SizedBox heightBox(double height) => SizedBox(height: height);
SizedBox widthBox(double width) => SizedBox(width: width);
