import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final String? title;
  final onPressed;

  const RoundedElevatedButton({
    Key? key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
