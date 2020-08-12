import 'package:flutter/material.dart';

class FooterControl extends StatelessWidget {
  FooterControl({
    @required this.lastUpdated,
  });

  final DateTime lastUpdated;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Last updated at ${lastUpdated ?? ''}',
      textAlign: TextAlign.center,
    ));
  }
}
