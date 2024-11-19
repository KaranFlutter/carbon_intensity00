import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No internet connection. Please check your connection.',
        style: TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
