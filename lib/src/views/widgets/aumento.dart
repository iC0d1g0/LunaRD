import 'package:flutter/material.dart';

class MyAumt extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obsecureText;

  const MyAumt({super.key, 
  required this.hintText, 
  this.icon, 
  this.onPressed, 
  this.obsecureText = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0x00ffcec5).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           IconButton(onPressed: onPressed, icon: Icon(icon)),
           
        Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 45), // Ajusta el margen según sea necesario
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            
          ),
       
        ),
      ),


          IconButton(onPressed: onPressed, icon: Icon(icon)),
        ],
      ),
    );
  }
}