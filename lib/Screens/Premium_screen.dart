import 'package:flutter/material.dart';
class Premium extends StatelessWidget {
  static const routeName = '/Pre';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Only for PREMIUM Users'),),
      body: Container(
        child: Center(child: Text('Coming In Next Update...'),),
      ),
    );
  }
}