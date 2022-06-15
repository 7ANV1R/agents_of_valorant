import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderRotatingPlain extends StatelessWidget {
  const LoaderRotatingPlain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitRotatingPlain(
      color: Colors.red,
    );
  }
}
