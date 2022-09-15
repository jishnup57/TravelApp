
import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  const Seperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 2,
      indent: 30,
      endIndent: 30,
    );
  }
}