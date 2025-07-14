import 'package:flutter/material.dart';
/*
class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.user});
  final String user;
  @override
  State<HomePage> createState => _HomePageState();
}

class _HomePageState extends State<HomePage>{

}*/

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido a tu página principal!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}