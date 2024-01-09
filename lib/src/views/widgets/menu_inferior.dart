import 'package:flutter/material.dart';

class MenuInferior extends StatelessWidget {
  const MenuInferior({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: "Blog",
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: "Notas",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Color(0xFFD9D9D9),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Calendario",
          backgroundColor: Color(0xFFF57F17),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Ajustes",
          backgroundColor: Colors.purple,
        ),
      ],
      
      currentIndex: index,
    
      selectedItemColor: Colors.black, 
      unselectedItemColor: Colors.black54,
    
      onTap: (x){
        if(x == 0)Navigator.pushNamed(context, "/blog", arguments: x);
        if(x == 1)Navigator.pushNamed(context, "/notas", arguments: x);
        if(x == 2)Navigator.pushNamed(context, "/", arguments: x);
        if(x == 3)Navigator.pushNamed(context, "/login", arguments: x); //esto es solo para provar el menu inferior, realmente debe ser "/calendario"
        if(x == 4)Navigator.pushNamed(context, "/ajustes", arguments: x);
      },
    
      //iconSize: 15,
    
      //selectedFontSize: 10,
    
    );
  }
}
