import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrrorWidget extends StatelessWidget {
  const CustomErrrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: Styles.textStyle18,
    );
  }
}
