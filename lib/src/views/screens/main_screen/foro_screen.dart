import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import  'package:flutter/material.dart';
import 'package:luna_rd/src/views/widgets/text_field.dart';
import 'package:luna_rd/src/views/widgets/wall_post.dart';



class Foro extends StatefulWidget {
  const Foro({super.key});

  @override
  State<Foro> createState() => _ForoState();
}

class _ForoState extends State<Foro> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //controlador de texto
  final textController = TextEditingController();
  void signOut(){
    FirebaseAuth.instance.signOut();

  }

  //post Message 
  void postMessage(){
    //solo postear si hay algo en el TextField
    if(textController.text.isNotEmpty){
        //subir a firebase
        FirebaseFirestore.instance.collection('foro_luna').add({
          'UserEmail':currentUser.email,
          'Message' : textController.text,
          'TimeStamp': Timestamp.now(),
          'Likes': [],
        });
    }

    //limpiar el textFiled
    setState(() {
      textController.clear();
    });

  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Center(
          child: Text("FORO LUNA",style: TextStyle
                      (fontWeight: FontWeight.bold,
                      color:Colors.grey)),
          
          
          ),
        
      ),
      
     body: Center(
        child: Column(
          children: [
            //the wall
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                .collection('foro_luna')
                .orderBy(
                  "TimeStamp",
                  descending: false)
                .snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder:(context, index) {
                        //get MSGS
                        final post = snapshot.data!.docs[index]; 
                        return WallPost(
                          message: post['Message'],
                         user: post['UserEmail'],
                         postId: post.id,
                         likes: List<String>.from(post['Likes'] ?? []),
                         
                         );

                      },
                    );
                  }else if(snapshot.hasError){
                      return Center(
                        child: Text('ERROR: ${snapshot.error}'
                        ),
                      );
                  }
                  return const Center(child: CircularProgressIndicator(),
                  );
                },
              ), 
            ),
            //post msg
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //textfield
              
                  Expanded
                  (child: MytextField(
                    controller: textController,
                    hintText: 'Escribe algo en el foro..',
                    obscureText: false,
                    ),
                  ),
                  //post boton
                  IconButton(onPressed: postMessage,
                   icon: const Icon(Icons.arrow_circle_up)),
              
                ],
              
              ),
            ),

            // usuario actual
            Text("Usuario: ${currentUser.email!}"),
            
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}