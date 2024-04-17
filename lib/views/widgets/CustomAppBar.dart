import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text:  "Deep ",
                style:TextStyle(color: Colors.black,
                fontSize: 20, fontWeight: FontWeight.w600,
                )
            ),
            TextSpan(
                text: "Wallpaper",
              style:TextStyle(color: Colors.orangeAccent,
                fontSize: 20, fontWeight: FontWeight.w600,)

            ),

          ]
        ),),
    );
  }
}
