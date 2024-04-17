import 'package:flutter/material.dart';

class Catblock extends StatelessWidget {
  const Catblock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 3),
      

      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              height: 50,
                width: 100,
                fit : BoxFit.cover,
                "https://images.pexels.com/photos/909907/pexels-photo-909907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),

          Container(
            height: 50,
              width: 100,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12)),
          ),
          
          Positioned(
              left: 30,
              top: 15,
              child: Text("Cars",style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600),))
        ],
      ),
    );
  }
}
