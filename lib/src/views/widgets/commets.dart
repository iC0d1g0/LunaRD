import 'package:flutter/material.dart';


class Comments extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  
 
  const Comments( {
    super.key,
    
    required this.text,
    required this.user,
    required this.time,
   
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),  
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //comment
          Text(text),
          const SizedBox(height:5),
          //user,time
          Row(
            children: [
              Text(user,style: const TextStyle(color: Colors.grey),),
              const Text(" . ", style: TextStyle(color: Colors.grey),),
              Text(time, style: const TextStyle(color: Colors.grey),),
            ],
          ),
          

          
                        
                
        ]),
    );
  }
}