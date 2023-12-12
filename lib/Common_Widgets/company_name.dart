import 'package:flutter/material.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Niveus Solutions Pvt. Ltd.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}
