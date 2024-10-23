import 'package:flutter/material.dart';

class WelcomeMaterialButton extends StatelessWidget {
  const WelcomeMaterialButton(
      {super.key,
      required this.color,
      required this.onPressed,
      required this.textt,
      required this.image});
  final Color color;
  final Function() onPressed;
  final String image;
  final String textt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        height: 65,
        minWidth: double.infinity,
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(
              image,
              height: 27,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              textt,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
