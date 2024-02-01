

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/models/database/database_services.dart';
import 'package:luna_rd/src/views/widgets/comment_button.dart';
import 'package:luna_rd/src/views/widgets/commets.dart';
import 'package:luna_rd/src/views/widgets/delete_button.dart';
import 'package:luna_rd/src/views/widgets/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;

  final String postId;
  final List<String> likes;

  const WallPost({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
    
   
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {

  //documetos de los comments
  
  //current user
  final currentUSer = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  final _commentTextController = TextEditingController();
  final _commenttoCommentTextController = TextEditingController();
  ManageDatos formatea=ManageDatos();
  


  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUSer.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //accediendiedo al documento
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('foro_luna').doc(widget.postId);

    if (isLiked) {
      //si es like en el momento, agrega el correo en like fields
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUSer.email])
      });
    } else {
      // si el post no es likeao, remueve el email de el like Fields
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUSer.email])
      });
    }
  }

 
  //agregar comentarios
  void addComments(String commentText) {
    //escribir el comentario a firestore bajo los comentaris para este post
    FirebaseFirestore.instance
    .collection('foro_luna')
    .doc(widget.postId)
    .collection("Comments")
    .add({
    "CommentText": commentText,
    "CommentBy": currentUSer.email,
    "CommentTime": Timestamp.now() //recodar darle formato para usar
    });

  }

   void addCommentstoComments(String commentToCommentText) {
      
            //primero eliminar comentario de firestire(si solo elimnas el post los comentarios seguiran en la base de datos)
            FirebaseFirestore.instance
            .collection('foro_luna')
            .doc(widget.postId)
            .collection('Comments').add({
              "CommentText": commentToCommentText,
              "CommentBy": currentUSer.email,
              "CommentTime": Timestamp.now() //recodar darle formato para usar
            });
         
  }
  

  
void showCommentDialogComments() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agrega un comentario"),
        content: TextField(
          controller: _commenttoCommentTextController,
          decoration: const InputDecoration(hintText: "escribe un comentario"),
        ),
        actions: [
          //cancelar
          TextButton(
              onPressed: () { 
                Navigator.pop(context);
                //clear controller
                _commenttoCommentTextController.clear();
              } ,
              child: const Text("cancelar")
              
              ),

          //post
          TextButton(
              onPressed: () {
                //agregar comentario
                addCommentstoComments(_commentTextController.text);
                //limpiar le controlador

                _commenttoCommentTextController.clear();
                //pop box tambien
                Navigator.pop(context);

                },
              child: const Text("post")),
        ],
      ),
    );
  }
 



  //mostrar dialogo para comentar
  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agrega un comentario",style: TextStyle
                      (fontWeight: FontWeight.bold,
                      color:Color.fromARGB(255, 86, 47,92))),
        content: TextField(maxLines: null,
          controller: _commentTextController,
          decoration: const InputDecoration(hintText: "escribe un comentario",hintStyle: TextStyle
                      (color:Color.fromARGB(255, 86, 47,92))),
        ),
        actions: [
          //cancelar
          TextButton(
              onPressed: () { 
                Navigator.pop(context);
                //clear controller
                _commentTextController.clear();
              } ,
              child: const Text("cancelar",style: TextStyle(color:Color.fromARGB(255, 86, 47,92))),
              
      ),

          //post
          TextButton(
              onPressed: () {
                //agregar comentario
                addComments(_commentTextController.text);
                //limpiar le controlador

                _commentTextController.clear();
                //pop box tambien
                Navigator.pop(context);

                },
              child: const Text("post",style: TextStyle
                      (color:Color.fromARGB(255, 86, 47,92)))),
        ],
      ),
    );
  }

  void deletePost(){
    //Dialog para solicitar informacion
      showDialog(context: context, builder:(context) => AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Seguro que desea eliminar este post'),
        actions: [
          TextButton(onPressed:() => Navigator.pop(context),
          child: const Text("cancel"),
          ),

          TextButton(
          onPressed:() async {
            //primero eliminar comentario de firestire(si solo elimnas el post los comentarios seguiran en la base de datos)
            final commentsDocs = await FirebaseFirestore.instance
            .collection('foro_luna')
            .doc(widget.postId)
            .collection('Comments').get();

            for (var doc in commentsDocs.docs){
              await FirebaseFirestore.
              instance.collection('foro_luna')
              .doc(widget.postId)
              .collection('Comments')
              .doc(doc.id)
              .delete();
              //luego se elimina el post
            }
            FirebaseFirestore.instance
            .collection('foro_luna')
            .doc(widget.postId)
            .delete();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: const Text("Eliminar"),
          ),

        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(220,251,225,242),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //wallpost
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            //el grupo de texto
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //messeague
                    Text(widget.message,style: const TextStyle
                        (fontWeight: FontWeight.bold,
                        color:Color.fromARGB(255, 86, 47,92))),
                
                      const SizedBox(height: 2),
                    //user
                    
                    Text(
                      widget.user,
                      style: const TextStyle(color:Color.fromARGB(220, 63,7,43)),
                    ),
                
                  ],
                ),
              ),
              if(widget.user == currentUSer.email)
              DeleteBoutton(onTap: deletePost),

              

            ],
          ),

          const SizedBox(width: 20),

          //botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //like
              Column(
                children: [
                  LikeButton(
                    isLiked: isLiked,
                    onTap: toggleLike),

                  const SizedBox(height: 5),
                  //contador de likes
                  Text(
                    widget.likes.length.toString(),
                    style: const TextStyle(color: Color.fromARGB(220, 63,7,43)),
                  ),
                ],
                ),
                const SizedBox(width: 10),
                //Comments
                Column(
                children: [
                  
                  CommentBoutton(onTap: showCommentDialog),

                  const SizedBox(height: 5),
                  //contador de comentarios
                  const Text(
                   '0' ,
                    style: TextStyle(color:  Color.fromARGB(220, 63,7,43)),
                  ),
                  
                ],
              ),
              
            ],
              
          ),
          
          //comments under the post
          StreamBuilder<QuerySnapshot>(
            
            stream: FirebaseFirestore.instance
            .collection("foro_luna")
            .doc(widget.postId)
            .collection("Comments")
            .orderBy("CommentTime", descending: false)
            .snapshots(),
            builder:(context, snapshot) {

            //mostrar un circular si no hay datos 
            
           return ListView(
           shrinkWrap: true, //para listas anidadas
            physics: const NeverScrollableScrollPhysics(),
                  
            children: snapshot.data != null
                    ? snapshot.data!.docs.map((doc) {
                        //obteniendo el comentario desde firebase
                        final commentData = doc.data() as Map<String, dynamic>;

                    
            //y retornar el comentario en ui
              return Comments(
              text: commentData["CommentText"], 
              user: commentData["CommentBy"],
              time: formatea.formatDateHora2(commentData["CommentTime"],),
              
                       
              );
              }).toList() :[],
              
              

              );
              
          },

          
        ),
        
        ],
      ),
      
      
    );
    
  }
}
