import 'package:flutter/material.dart';

class Premium extends StatelessWidget {
  static const routeName = '/Pre';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Only for PREMIUM Users'),
      ),
      body: Center(
        child: Text('Coming In Next Update...'),
      ),
    );
  }
}
