import 'package:flutter/material.dart';

void main() => runApp(const LecturasApp());

class LecturasApp extends StatelessWidget {
  const LecturasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Fondo de la aplicación en color negro
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Lecturas-Andrea Roldan 6-I', 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
          ),
          backgroundColor: const Color(0xFFFFD1DC), // Rosa claro
          elevation: 0,
          centerTitle: true,
        ),
        body: const ListaLecturas(),
      ),
    );
  }
}

class ListaLecturas extends StatelessWidget {
  const ListaLecturas({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de las 5 tarjetas de lectura
    final List<Map<String, String>> libros = [
      {'titulo': 'Romance Infinito', 'desc': 'Un amor que desafía el tiempo y el espacio.', 'img': 'https://raw.githubusercontent.com/RoldanOrtega/UII_Act-2_Tarjetas/refs/heads/main/romance.JPG'},
      {'titulo': 'Suspenso en la Niebla', 'desc': 'Nadie sabe quién desapareció primero.', 'img': 'https://raw.githubusercontent.com/RoldanOrtega/UII_Act-2_Tarjetas/refs/heads/main/suspenso.JPG'},
      {'titulo': 'Comedia de Enredos', 'desc': 'Tres amigos, un perro y una boda fallida.', 'img': 'https://raw.githubusercontent.com/RoldanOrtega/UII_Act-2_Tarjetas/refs/heads/main/comedia.JPG'},
      {'titulo': 'Fantasía Épica', 'desc': 'El último dragón busca a su jinete perdido.', 'img': 'https://raw.githubusercontent.com/RoldanOrtega/UII_Act-2_Tarjetas/refs/heads/main/fantasia.JPG'},
      {'titulo': 'Acción Total', 'desc': 'Una persecución a alta velocidad por la ciudad.', 'img': 'https://raw.githubusercontent.com/RoldanOrtega/UII_Act-2_Tarjetas/refs/heads/main/accion.JPG'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: libros.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 25),
          // Decoración para el "iluminado" rosa fuerte y la sombra blanca
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              const BoxShadow(
                color: Colors.white, // Sombreado blanco
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
              const BoxShadow(
                color: Color(0xFFFF1493), // Iluminado rosa fuerte (Deep Pink)
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Card(
            margin: EdgeInsets.zero, // El margen lo controla el Container
            color: const Color(0xFFFFD1DC), // Fondo rosa claro
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.black, width: 2), // Contorno negro
            ),
            child: Row(
              children: [
                // Imagen a la izquierda (usando ClipRRect para redondear bordes)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                  ),
                  child: Image.network(
                    libros[index]['img']!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                // Textos a la derecha
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          libros[index]['titulo']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF221122), // Rosa casi negro (Corregido)
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          libros[index]['desc']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black, // Descripción negra
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}